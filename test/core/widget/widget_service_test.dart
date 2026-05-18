import 'package:flutter_test/flutter_test.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/widget/widget_service.dart';

/// Tests for the WidgetService logic.
///
/// Since home_widget requires platform channels that are unavailable in unit
/// tests, we verify the public API surface and the data model expectations.
/// Integration testing of the actual UserDefaults write path requires a
/// running iOS simulator.
void main() {
  group('WidgetService', () {
    test('service class exists and has expected static methods', () {
      // Verify the public API is accessible at compile time.
      // We cannot call initialize() or updateWidget() without platform
      // channels, but we can confirm the class is importable and the
      // methods exist.
      expect(WidgetService.initialize, isA<Function>());
      expect(WidgetService.updateWidget, isA<Function>());
      expect(WidgetService.updateWidgetFromPhaseInfo, isA<Function>());
    });

    test('MoonPhaseInfo displayName covers all phases', () {
      expect(MoonPhase.newMoon.displayName, 'New Moon');
      expect(MoonPhase.waxing.displayName, 'Waxing');
      expect(MoonPhase.fullMoon.displayName, 'Full Moon');
      expect(MoonPhase.waning.displayName, 'Waning');
    });

    test('MoonPhase index values are stable for widget data contract', () {
      // The native widget reads phaseIndex to determine waxing vs waning
      // rendering. These indices must remain stable.
      expect(MoonPhase.newMoon.index, 0);
      expect(MoonPhase.waxing.index, 1);
      expect(MoonPhase.fullMoon.index, 2);
      expect(MoonPhase.waning.index, 3);
    });
  });
}
