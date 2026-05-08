import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moon_manifest/data/models/cycle.dart';
import 'package:moon_manifest/data/repositories/cycle_repository.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final cycleRepositoryProvider = Provider<CycleRepository>((ref) {
  return CycleRepository(ref.watch(secureStorageProvider));
});

final activeCycleProvider = AsyncNotifierProvider<ActiveCycleNotifier, Cycle?>(ActiveCycleNotifier.new);

class ActiveCycleNotifier extends AsyncNotifier<Cycle?> {
  @override
  Future<Cycle?> build() async {
    final repo = ref.watch(cycleRepositoryProvider);
    return repo.getActiveCycle();
  }

  Future<void> startCycle({required String id, required DateTime newMoonDate, required List<Intention> intentions}) async {
    final repo = ref.read(cycleRepositoryProvider);
    final cycle = Cycle(id: id, newMoonDate: newMoonDate, intentions: intentions, intentionsLocked: true);
    await repo.saveActiveCycle(cycle);
    state = AsyncData(cycle);
  }

  Future<void> addGratitude(Gratitude gratitude) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final updated = current.copyWith(gratitudes: [...current.gratitudes, gratitude]);
    final repo = ref.read(cycleRepositoryProvider);
    await repo.saveActiveCycle(updated);
    state = AsyncData(updated);
  }

  Future<void> completeGratitude() async {
    final current = state.valueOrNull;
    if (current == null) return;
    final updated = current.copyWith(gratitudeCompleted: true);
    final repo = ref.read(cycleRepositoryProvider);
    await repo.saveActiveCycle(updated);
    state = AsyncData(updated);
  }

  Future<void> completeCycle() async {
    final current = state.valueOrNull;
    if (current == null) return;
    final repo = ref.read(cycleRepositoryProvider);
    await repo.completeCycle(current);
    state = const AsyncData(null);
  }
}

final historyProvider = FutureProvider<List<Cycle>>((ref) async {
  final repo = ref.watch(cycleRepositoryProvider);
  return repo.getHistory();
});

final scratchpadProvider = AsyncNotifierProvider<ScratchpadNotifier, String?>(ScratchpadNotifier.new);

class ScratchpadNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    final repo = ref.watch(cycleRepositoryProvider);
    return repo.getScratchpad();
  }

  Future<void> save(String text) async {
    final repo = ref.read(cycleRepositoryProvider);
    await repo.saveScratchpad(text);
    state = AsyncData(text);
  }

  Future<void> clear() async {
    final repo = ref.read(cycleRepositoryProvider);
    await repo.clearScratchpad();
    state = const AsyncData(null);
  }
}
