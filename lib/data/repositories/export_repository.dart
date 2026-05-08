import 'dart:convert';
import 'dart:typed_data';
import 'package:moon_manifest/core/crypto/export_crypto.dart';
import 'package:moon_manifest/data/repositories/cycle_repository.dart';

class ExportRepository {
  final CycleRepository _cycleRepo;
  final ExportCrypto _crypto;

  ExportRepository(this._cycleRepo, this._crypto);

  Future<Uint8List> exportData(String password) async {
    final data = await _cycleRepo.exportAll();
    final jsonString = jsonEncode(data);
    return _crypto.encrypt(jsonString, password);
  }

  Future<void> importData(Uint8List encryptedData, String password) async {
    final jsonString = _crypto.decrypt(encryptedData, password);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;
    await _cycleRepo.importAll(data);
  }
}
