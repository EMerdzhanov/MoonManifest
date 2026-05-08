import 'package:moon_manifest/core/moon/moon_phase.dart';
import 'package:moon_manifest/data/models/cycle.dart';

class LunarState {
  final MoonPhase phase;
  final int dayInPhase;
  final int totalDaysInPhase;
  final bool isGracePeriod;
  final DateTime? graceDeadline;
  final Cycle? activeCycle;
  final DateTime nextNewMoon;
  final DateTime nextFullMoon;
  final double illumination;

  const LunarState({
    required this.phase,
    required this.dayInPhase,
    required this.totalDaysInPhase,
    required this.isGracePeriod,
    this.graceDeadline,
    this.activeCycle,
    required this.nextNewMoon,
    required this.nextFullMoon,
    required this.illumination,
    this.hasCompletedCycleBefore = false,
  });

  /// Only show waiting screen for first-time users who haven't completed
  /// a cycle yet AND aren't in a new moon window. Users who completed a
  /// cycle should see the actual phase screen (e.g., waning), not waiting.
  final bool hasCompletedCycleBefore;

  bool get shouldShowWaiting =>
      activeCycle == null &&
      phase != MoonPhase.newMoon &&
      !hasCompletedCycleBefore;
  bool get canSetIntentions => phase == MoonPhase.newMoon && (activeCycle == null || !activeCycle!.intentionsLocked);
  bool get canDoGratitude => phase == MoonPhase.fullMoon && activeCycle != null && !activeCycle!.gratitudeCompleted;
}
