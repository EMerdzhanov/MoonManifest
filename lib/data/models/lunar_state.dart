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
  });

  bool get shouldShowWaiting => activeCycle == null && phase != MoonPhase.newMoon;
  bool get canSetIntentions => phase == MoonPhase.newMoon && (activeCycle == null || !activeCycle!.intentionsLocked);
  bool get canDoGratitude => phase == MoonPhase.fullMoon && activeCycle != null && !activeCycle!.gratitudeCompleted;
}
