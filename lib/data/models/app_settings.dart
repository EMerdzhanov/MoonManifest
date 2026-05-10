class AppSettings {
  final int notificationFrequency;
  final String wakeWindowStart;
  final String wakeWindowEnd;
  final bool onboardingComplete;
  final String themeMode;
  final String moonStyle;

  const AppSettings({
    this.notificationFrequency = 3,
    this.wakeWindowStart = '07:00',
    this.wakeWindowEnd = '22:00',
    this.onboardingComplete = false,
    this.themeMode = 'dark',
    this.moonStyle = 'classic',
  });

  AppSettings copyWith({
    int? notificationFrequency, String? wakeWindowStart,
    String? wakeWindowEnd, bool? onboardingComplete, String? themeMode,
    String? moonStyle,
  }) => AppSettings(
    notificationFrequency: notificationFrequency ?? this.notificationFrequency,
    wakeWindowStart: wakeWindowStart ?? this.wakeWindowStart,
    wakeWindowEnd: wakeWindowEnd ?? this.wakeWindowEnd,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    themeMode: themeMode ?? this.themeMode,
    moonStyle: moonStyle ?? this.moonStyle,
  );

  (int hour, int minute) get wakeStart {
    final parts = wakeWindowStart.split(':');
    return (int.parse(parts[0]), int.parse(parts[1]));
  }

  (int hour, int minute) get wakeEnd {
    final parts = wakeWindowEnd.split(':');
    return (int.parse(parts[0]), int.parse(parts[1]));
  }
}
