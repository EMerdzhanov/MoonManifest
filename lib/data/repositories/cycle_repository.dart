import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moon_manifest/data/models/cycle.dart';

class CycleRepository {
  static const _keyActiveCycle = 'active_cycle';
  static const _keyScratchpad = 'scratchpad';
  static const _keyHistoryIndex = 'history_index';

  final FlutterSecureStorage _storage;
  CycleRepository(this._storage);

  Future<Cycle?> getActiveCycle() async {
    final json = await _storage.read(key: _keyActiveCycle);
    if (json == null) return null;
    return Cycle.fromJsonString(json);
  }

  Future<void> saveActiveCycle(Cycle cycle) async {
    await _storage.write(key: _keyActiveCycle, value: cycle.toJsonString());
  }

  Future<void> clearActiveCycle() async => _storage.delete(key: _keyActiveCycle);

  Future<void> completeCycle(Cycle cycle) async {
    final completed = cycle.copyWith(cycleEndDate: DateTime.now().toUtc());
    await _addToHistory(completed);
    await clearActiveCycle();
  }

  Future<List<Cycle>> getHistory() async {
    final indexJson = await _storage.read(key: _keyHistoryIndex);
    if (indexJson == null) return [];
    final keys = (jsonDecode(indexJson) as List<dynamic>).cast<String>();
    final cycles = <Cycle>[];
    for (final key in keys) {
      final json = await _storage.read(key: key);
      if (json != null) cycles.add(Cycle.fromJsonString(json));
    }
    return cycles..sort((a, b) => b.newMoonDate.compareTo(a.newMoonDate));
  }

  Future<void> _addToHistory(Cycle cycle) async {
    final key = 'cycle_${cycle.id}';
    await _storage.write(key: key, value: cycle.toJsonString());
    final indexJson = await _storage.read(key: _keyHistoryIndex);
    final keys = indexJson != null ? (jsonDecode(indexJson) as List<dynamic>).cast<String>() : <String>[];
    if (!keys.contains(key)) keys.add(key);
    await _storage.write(key: _keyHistoryIndex, value: jsonEncode(keys));
  }

  Future<String?> getScratchpad() async => _storage.read(key: _keyScratchpad);
  Future<void> saveScratchpad(String text) async => _storage.write(key: _keyScratchpad, value: text);
  Future<void> clearScratchpad() async => _storage.delete(key: _keyScratchpad);

  Future<Map<String, dynamic>> exportAll() async {
    final activeCycle = await getActiveCycle();
    final history = await getHistory();
    final scratchpad = await getScratchpad();
    return {
      'activeCycle': activeCycle?.toJson(),
      'history': history.map((c) => c.toJson()).toList(),
      'scratchpad': scratchpad,
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
    };
  }

  Future<void> importAll(Map<String, dynamic> data) async {
    if (data['activeCycle'] != null) {
      await saveActiveCycle(Cycle.fromJson(data['activeCycle'] as Map<String, dynamic>));
    }
    if (data['history'] != null) {
      for (final cycleJson in data['history'] as List<dynamic>) {
        await _addToHistory(Cycle.fromJson(cycleJson as Map<String, dynamic>));
      }
    }
    if (data['scratchpad'] != null) await saveScratchpad(data['scratchpad'] as String);
  }
}
