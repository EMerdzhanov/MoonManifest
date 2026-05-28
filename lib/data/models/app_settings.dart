class AppSettings {
  final int notificationFrequency;
  final String wakeWindowStart;
  final String wakeWindowEnd;
  final bool onboardingComplete;
  final String themeMode;
  final String moonStyle;
  final String? locale;

  const AppSettings({
    this.notificationFrequency = 3,
    this.wakeWindowStart = '07:00',
    this.wakeWindowEnd = '22:00',
    this.onboardingComplete = false,
    this.themeMode = 'dark',
    this.moonStyle = 'classic',
    this.locale,
  });

  AppSettings copyWith({
    int? notificationFrequency, String? wakeWindowStart,
    String? wakeWindowEnd, bool? onboardingComplete, String? themeMode,
    String? moonStyle, String? Function()? locale,
  }) => AppSettings(
    notificationFrequency: notificationFrequency ?? this.notificationFrequency,
    wakeWindowStart: wakeWindowStart ?? this.wakeWindowStart,
    wakeWindowEnd: wakeWindowEnd ?? this.wakeWindowEnd,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
    themeMode: themeMode ?? this.themeMode,
    moonStyle: moonStyle ?? this.moonStyle,
    locale: locale != null ? locale() : this.locale,
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
