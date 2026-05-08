enum MoonPhase {
  newMoon,
  waxing,
  fullMoon,
  waning;

  String get displayName {
    switch (this) {
      case MoonPhase.newMoon:
        return 'New Moon';
      case MoonPhase.waxing:
        return 'Waxing';
      case MoonPhase.fullMoon:
        return 'Full Moon';
      case MoonPhase.waning:
        return 'Waning';
    }
  }
}

class MoonPhaseInfo {
  final MoonPhase phase;
  final DateTime phaseStart;
  final DateTime phaseEnd;
  final int dayInPhase;
  final int totalDaysInPhase;
  final bool isGracePeriod;
  final DateTime? graceDeadline;
  final DateTime nextNewMoon;
  final DateTime nextFullMoon;
  final double illumination;

  const MoonPhaseInfo({
    required this.phase,
    required this.phaseStart,
    required this.phaseEnd,
    required this.dayInPhase,
    required this.totalDaysInPhase,
    required this.isGracePeriod,
    this.graceDeadline,
    required this.nextNewMoon,
    required this.nextFullMoon,
    required this.illumination,
  });
}
