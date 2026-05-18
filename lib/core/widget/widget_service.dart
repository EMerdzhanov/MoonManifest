import 'package:home_widget/home_widget.dart';
import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/core/moon/moon_phase_engine.dart';

/// Service that bridges Flutter moon phase data to the native iOS home screen
/// widget via shared UserDefaults (App Groups).
///
/// The native widget extension reads these keys from the shared container
/// and renders accordingly.
class WidgetService {
  WidgetService._();

  /// The App Group identifier shared between the main app and the widget
  /// extension. Must match the value configured in Xcode for both targets.
  static const String _appGroupId = 'group.com.moonmanifest.moonManifest';

  /// The iOS widget name (matches the SwiftUI widget struct name).
  static const String _iOSWidgetName = 'MoonPhaseWidget';

  /// Keys written to shared UserDefaults.
  static const String _keyPhaseName = 'moon_phase_name';
  static const String _keyPhaseIndex = 'moon_phase_index';
  static const String _keyDayInPhase = 'moon_day_in_phase';
  static const String _keyTotalDays = 'moon_total_days_in_phase';
  static const String _keyIllumination = 'moon_illumination';
  static const String _keyNextNewMoon = 'moon_next_new_moon';
  static const String _keyNextFullMoon = 'moon_next_full_moon';
  static const String _keyDaysUntilNewMoon = 'moon_days_until_new';
  static const String _keyDaysUntilFullMoon = 'moon_days_until_full';
  static const String _keyNextEventLabel = 'moon_next_event_label';
  static const String _keyProgressFraction = 'moon_progress_fraction';
  static const String _keyLastUpdated = 'moon_last_updated';

  /// Initialize the home_widget package with the App Group ID.
  static Future<void> initialize() async {
    await HomeWidget.setAppGroupId(_appGroupId);
  }

  /// Computes current moon phase data from [engine] and writes it to the
  /// shared UserDefaults container, then requests a widget update.
  static Future<void> updateWidget(MoonPhaseEngine engine) async {
    final now = engine.now;
    final info = engine.currentPhase(now);

    await _writePhaseData(info, now);
    await _requestWidgetUpdate();
  }

  /// Writes phase data directly from a [MoonPhaseInfo] already computed
  /// elsewhere (e.g. from LunarStateNotifier._computeState).
  static Future<void> updateWidgetFromPhaseInfo(MoonPhaseInfo info) async {
    final now = DateTime.now().toUtc();
    await _writePhaseData(info, now);
    await _requestWidgetUpdate();
  }

  static Future<void> _writePhaseData(MoonPhaseInfo info, DateTime now) async {
    final daysUntilNew = info.nextNewMoon.difference(now).inDays;
    final daysUntilFull = info.nextFullMoon.difference(now).inDays;

    // Determine which upcoming event is closer and build the label.
    final String nextEventLabel;
    if (info.phase == MoonPhase.newMoon) {
      nextEventLabel = 'New Moon now';
    } else if (info.phase == MoonPhase.fullMoon) {
      nextEventLabel = 'Full Moon now';
    } else if (daysUntilFull <= daysUntilNew) {
      nextEventLabel = daysUntilFull == 1
          ? 'Full Moon tomorrow'
          : 'Full Moon in $daysUntilFull days';
    } else {
      nextEventLabel = daysUntilNew == 1
          ? 'New Moon tomorrow'
          : 'New Moon in $daysUntilNew days';
    }

    // Progress fraction through the current phase (0.0 to 1.0).
    final progressFraction = info.totalDaysInPhase > 0
        ? (info.dayInPhase / info.totalDaysInPhase).clamp(0.0, 1.0)
        : 0.0;

    await Future.wait([
      HomeWidget.saveWidgetData(_keyPhaseName, info.phase.displayName),
      HomeWidget.saveWidgetData(_keyPhaseIndex, info.phase.index),
      HomeWidget.saveWidgetData(_keyDayInPhase, info.dayInPhase),
      HomeWidget.saveWidgetData(_keyTotalDays, info.totalDaysInPhase),
      HomeWidget.saveWidgetData(_keyIllumination, info.illumination),
      HomeWidget.saveWidgetData(
          _keyNextNewMoon, info.nextNewMoon.toIso8601String()),
      HomeWidget.saveWidgetData(
          _keyNextFullMoon, info.nextFullMoon.toIso8601String()),
      HomeWidget.saveWidgetData(_keyDaysUntilNewMoon, daysUntilNew),
      HomeWidget.saveWidgetData(_keyDaysUntilFullMoon, daysUntilFull),
      HomeWidget.saveWidgetData(_keyNextEventLabel, nextEventLabel),
      HomeWidget.saveWidgetData(_keyProgressFraction, progressFraction),
      HomeWidget.saveWidgetData(_keyLastUpdated, now.toIso8601String()),
    ]);
  }

  static Future<void> _requestWidgetUpdate() async {
    await HomeWidget.updateWidget(
      iOSName: _iOSWidgetName,
    );
  }
}
