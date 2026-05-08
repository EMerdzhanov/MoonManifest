import 'package:flutter_test/flutter_test.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/moon/moon_phase_engine.dart';

void main() {
  late MoonPhaseEngine engine;

  setUp(() {
    engine = MoonPhaseEngine();
  });

  // Helper: create UTC DateTime
  DateTime utc(int y, int m, int d, [int h = 0, int min = 0]) =>
      DateTime.utc(y, m, d, h, min);

  group('nextNewMoon', () {
    // Known new moon dates (UTC) — we ask for nextNewMoon from 1 day before
    // and verify the result is within 24 hours of the known time.
    final knownNewMoons = <DateTime>[
      // 2024
      utc(2024, 1, 11, 11, 57),
      utc(2024, 2, 9, 23, 59),
      utc(2024, 3, 10, 9, 0),
      utc(2024, 4, 8, 18, 21),
      utc(2024, 5, 8, 3, 22),
      utc(2024, 6, 6, 12, 38),
      utc(2024, 7, 5, 22, 57),
      utc(2024, 8, 4, 11, 13),
      utc(2024, 9, 3, 1, 56),
      utc(2024, 10, 2, 18, 49),
      utc(2024, 11, 1, 12, 47),
      utc(2024, 12, 1, 6, 21),
      utc(2024, 12, 30, 22, 27),
      // 2025
      utc(2025, 1, 29, 12, 36),
      utc(2025, 2, 28, 0, 45),
      utc(2025, 3, 29, 10, 58),
      utc(2025, 4, 27, 19, 31),
      utc(2025, 5, 27, 3, 2),
      utc(2025, 6, 25, 10, 32),
      utc(2025, 7, 24, 19, 11),
      utc(2025, 8, 23, 6, 6),
      utc(2025, 9, 21, 19, 54),
      utc(2025, 10, 21, 12, 25),
      utc(2025, 11, 20, 6, 47),
      utc(2025, 12, 20, 1, 43),
      // 2026
      utc(2026, 1, 18, 19, 52),
      utc(2026, 2, 17, 12, 1),
      utc(2026, 3, 19, 1, 23),
      utc(2026, 4, 17, 11, 52),
      utc(2026, 5, 16, 20, 1),
      utc(2026, 6, 15, 2, 54),
      // 2027
      utc(2027, 1, 7, 20, 24),
      utc(2027, 2, 6, 8, 56),
      utc(2027, 3, 7, 21, 6),
      utc(2027, 6, 4, 6, 40),
      utc(2027, 12, 28, 4, 36),
      // 2028
      utc(2028, 1, 26, 20, 13),
      utc(2028, 6, 22, 4, 27),
      utc(2028, 12, 16, 4, 6),
      // 2029
      utc(2029, 1, 14, 17, 25),
      utc(2029, 6, 12, 1, 51),
      utc(2029, 12, 5, 14, 52),
      // 2030
      utc(2030, 1, 4, 2, 50),
      utc(2030, 6, 1, 21, 21),
    ];

    for (final known in knownNewMoons) {
      test('nextNewMoon near ${known.toIso8601String()}', () {
        // Ask from 2 days before the known date
        final from = known.subtract(const Duration(days: 2));
        final computed = engine.nextNewMoon(from);
        final diff = computed.difference(known).inHours.abs();
        expect(diff, lessThanOrEqualTo(24),
            reason:
                'Expected new moon near $known, got $computed (diff: ${diff}h)');
      });
    }
  });

  group('nextFullMoon', () {
    final knownFullMoons = <DateTime>[
      utc(2024, 1, 25, 17, 54),
      utc(2024, 2, 24, 12, 30),
      utc(2024, 3, 25, 7, 0),
      utc(2024, 7, 21, 10, 17),
      utc(2024, 12, 15, 9, 2),
      utc(2025, 1, 13, 22, 27),
      utc(2025, 6, 11, 7, 44),
      utc(2025, 12, 4, 23, 14),
      utc(2026, 1, 3, 10, 3),
      utc(2026, 5, 31, 8, 45),
    ];

    for (final known in knownFullMoons) {
      test('nextFullMoon near ${known.toIso8601String()}', () {
        final from = known.subtract(const Duration(days: 2));
        final computed = engine.nextFullMoon(from);
        final diff = computed.difference(known).inHours.abs();
        expect(diff, lessThanOrEqualTo(24),
            reason:
                'Expected full moon near $known, got $computed (diff: ${diff}h)');
      });
    }
  });

  group('currentPhase', () {
    test('returns newMoon during a known new moon', () {
      // Jan 11, 2024 11:57 UTC is a known new moon
      final info = engine.currentPhase(utc(2024, 1, 11, 12, 0));
      expect(info.phase, equals(MoonPhase.newMoon));
      expect(info.isGracePeriod, isFalse);
    });

    test('returns newMoon with grace period 36 hours after new moon', () {
      // 36 hours after Jan 11, 2024 11:57 = Jan 13 ~00:00
      final newMoonTime = utc(2024, 1, 11, 11, 57);
      final testTime = newMoonTime.add(const Duration(hours: 36));
      final info = engine.currentPhase(testTime);
      expect(info.phase, equals(MoonPhase.newMoon));
      expect(info.isGracePeriod, isTrue);
      expect(info.graceDeadline, isNotNull);
    });

    test('returns waxing 4 days after new moon (past grace)', () {
      final newMoonTime = utc(2024, 1, 11, 11, 57);
      final testTime = newMoonTime.add(const Duration(days: 4));
      final info = engine.currentPhase(testTime);
      expect(info.phase, equals(MoonPhase.waxing));
    });

    test('returns fullMoon during a known full moon', () {
      // Jan 25, 2024 17:54 UTC is a known full moon
      final info = engine.currentPhase(utc(2024, 1, 25, 18, 0));
      expect(info.phase, equals(MoonPhase.fullMoon));
      expect(info.isGracePeriod, isFalse);
    });

    test('returns fullMoon with grace period 36 hours after full moon', () {
      final fullMoonTime = utc(2024, 1, 25, 17, 54);
      final testTime = fullMoonTime.add(const Duration(hours: 36));
      final info = engine.currentPhase(testTime);
      expect(info.phase, equals(MoonPhase.fullMoon));
      expect(info.isGracePeriod, isTrue);
      expect(info.graceDeadline, isNotNull);
    });

    test('returns waning 4 days after full moon', () {
      final fullMoonTime = utc(2024, 1, 25, 17, 54);
      final testTime = fullMoonTime.add(const Duration(days: 4));
      final info = engine.currentPhase(testTime);
      expect(info.phase, equals(MoonPhase.waning));
    });

    test('returns waxing midway between new and full moon', () {
      // New moon Jan 11, Full moon Jan 25 => midway ~ Jan 18
      final info = engine.currentPhase(utc(2024, 1, 18, 12, 0));
      expect(info.phase, equals(MoonPhase.waxing));
    });

    test('returns waning midway between full and next new moon', () {
      // Full moon Jan 25, next new moon Feb 9 => midway ~ Feb 2
      final info = engine.currentPhase(utc(2024, 2, 2, 12, 0));
      expect(info.phase, equals(MoonPhase.waning));
    });

    test('dayInPhase increments correctly', () {
      // 1 day after new moon window ends (day 1 of waxing)
      final newMoonTime = utc(2024, 1, 11, 11, 57);
      final day1 = newMoonTime.add(const Duration(hours: 73));
      final day2 = newMoonTime.add(const Duration(hours: 97));
      final info1 = engine.currentPhase(day1);
      final info2 = engine.currentPhase(day2);
      expect(info1.phase, equals(MoonPhase.waxing));
      expect(info2.phase, equals(MoonPhase.waxing));
      expect(info2.dayInPhase, greaterThan(info1.dayInPhase));
    });

    test('illumination near 0 at new moon', () {
      final info = engine.currentPhase(utc(2024, 1, 11, 12, 0));
      expect(info.illumination, lessThan(0.15));
    });

    test('illumination near 1 at full moon', () {
      final info = engine.currentPhase(utc(2024, 1, 25, 18, 0));
      expect(info.illumination, greaterThan(0.85));
    });

    test('provides nextNewMoon and nextFullMoon', () {
      final info = engine.currentPhase(utc(2024, 1, 18, 12, 0));
      // Next full moon should be around Jan 25
      expect(info.nextFullMoon.month, equals(1));
      expect(info.nextFullMoon.day, closeTo(25, 2));
      // Next new moon should be around Feb 9
      expect(info.nextNewMoon.month, equals(2));
      expect(info.nextNewMoon.day, closeTo(9, 2));
    });
  });

  group('Edge cases', () {
    test('phase transitions are contiguous (no gaps over 60 days)', () {
      // Walk through 60 days starting Jan 1 2024, every 6 hours
      var current = utc(2024, 1, 1);
      final end = utc(2024, 3, 1);
      MoonPhaseInfo? prev;

      while (current.isBefore(end)) {
        final info = engine.currentPhase(current);
        if (prev != null) {
          // Phase end of previous step should be >= phase start of current
          // (i.e., no gaps)
          expect(
            info.phaseStart.isBefore(
                prev.phaseEnd.add(const Duration(hours: 1))),
            isTrue,
            reason:
                'Gap detected at $current: prev end=${prev.phaseEnd}, cur start=${info.phaseStart}',
          );
        }
        prev = info;
        current = current.add(const Duration(hours: 6));
      }
    });

    test('handles dates far in future (2030)', () {
      final info = engine.currentPhase(utc(2030, 6, 1, 12, 0));
      expect(info.phase, isNotNull);
      expect(info.nextNewMoon.isAfter(utc(2030, 5, 1)), isTrue);
    });

    test('handles dates in past (2020)', () {
      final info = engine.currentPhase(utc(2020, 6, 15, 12, 0));
      expect(info.phase, isNotNull);
      expect(info.nextNewMoon.isAfter(utc(2020, 6, 15)), isTrue);
    });
  });

  group('phaseAtDate alias', () {
    test('phaseAtDate returns same result as currentPhase', () {
      final date = utc(2024, 3, 15, 12, 0);
      final info1 = engine.currentPhase(date);
      final info2 = engine.phaseAtDate(date);
      expect(info2.phase, equals(info1.phase));
      expect(info2.dayInPhase, equals(info1.dayInPhase));
    });
  });

  group('debugDateOverride', () {
    test('now getter uses debugDateOverride when set', () {
      engine.debugDateOverride = utc(2024, 7, 5, 23, 0);
      final info = engine.currentPhase(engine.now);
      expect(info.phase, equals(MoonPhase.newMoon));
    });

    test('now getter returns current UTC time when override is null', () {
      engine.debugDateOverride = null;
      final now = engine.now;
      final diff = now.difference(DateTime.now().toUtc()).inSeconds.abs();
      expect(diff, lessThan(2));
    });
  });
}
