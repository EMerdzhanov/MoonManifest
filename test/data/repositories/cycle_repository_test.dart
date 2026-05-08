import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moon_manifest/data/models/cycle.dart';
import 'package:moon_manifest/data/repositories/cycle_repository.dart';

void main() {
  late CycleRepository repo;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
    repo = CycleRepository(const FlutterSecureStorage());
  });

  Cycle makeCycle({String id = 'test_cycle'}) => Cycle(
    id: id,
    newMoonDate: DateTime.utc(2025, 1, 29),
    intentions: [Intention(id: 'i1', text: 'Financial relief', createdAt: DateTime.utc(2025, 1, 29))],
    intentionsLocked: true,
  );

  group('active cycle', () {
    test('returns null when no active cycle', () async {
      expect(await repo.getActiveCycle(), isNull);
    });
    test('saves and retrieves active cycle', () async {
      await repo.saveActiveCycle(makeCycle());
      final loaded = await repo.getActiveCycle();
      expect(loaded, isNotNull);
      expect(loaded!.id, 'test_cycle');
      expect(loaded.intentions.length, 1);
      expect(loaded.intentions.first.text, 'Financial relief');
    });
    test('clears active cycle', () async {
      await repo.saveActiveCycle(makeCycle());
      await repo.clearActiveCycle();
      expect(await repo.getActiveCycle(), isNull);
    });
  });

  group('history', () {
    test('returns empty list when no history', () async {
      expect(await repo.getHistory(), isEmpty);
    });
    test('completeCycle moves active to history', () async {
      final cycle = makeCycle();
      await repo.saveActiveCycle(cycle);
      await repo.completeCycle(cycle);
      expect(await repo.getActiveCycle(), isNull);
      final history = await repo.getHistory();
      expect(history.length, 1);
      expect(history.first.id, 'test_cycle');
      expect(history.first.cycleEndDate, isNotNull);
    });
    test('multiple cycles sorted newest first', () async {
      await repo.completeCycle(Cycle(id: 'old', newMoonDate: DateTime.utc(2025, 1, 1)));
      await repo.completeCycle(Cycle(id: 'new', newMoonDate: DateTime.utc(2025, 2, 1)));
      final history = await repo.getHistory();
      expect(history.first.id, 'new');
    });
  });

  group('scratchpad', () {
    test('returns null when no scratchpad', () async {
      expect(await repo.getScratchpad(), isNull);
    });
    test('saves and retrieves scratchpad', () async {
      await repo.saveScratchpad('My draft intention');
      expect(await repo.getScratchpad(), 'My draft intention');
    });
  });

  group('export/import', () {
    test('round-trips all data', () async {
      await repo.saveActiveCycle(makeCycle(id: 'active'));
      await repo.completeCycle(makeCycle(id: 'history1'));
      await repo.saveScratchpad('draft notes');
      await repo.saveActiveCycle(makeCycle(id: 'active'));
      final exported = await repo.exportAll();
      await repo.clearActiveCycle();
      await repo.clearScratchpad();
      await repo.importAll(exported);
      expect((await repo.getActiveCycle())?.id, 'active');
      expect((await repo.getHistory()).any((c) => c.id == 'history1'), isTrue);
      expect(await repo.getScratchpad(), 'draft notes');
    });
  });
}
