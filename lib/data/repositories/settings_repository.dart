import 'package:shared_preferences/shared_preferences.dart';
import 'package:moon_manifest/data/models/app_settings.dart';

class SettingsRepository {
  static const _keyFrequency = 'notification_frequency';
  static const _keyWakeStart = 'wake_window_start';
  static const _keyWakeEnd = 'wake_window_end';
  static const _keyOnboarding = 'onboarding_complete';
  static const _keyTheme = 'theme_mode';

  final SharedPreferences _prefs;
  SettingsRepository(this._prefs);

  AppSettings load() => AppSettings(
    notificationFrequency: _prefs.getInt(_keyFrequency) ?? 3,
    wakeWindowStart: _prefs.getString(_keyWakeStart) ?? '07:00',
    wakeWindowEnd: _prefs.getString(_keyWakeEnd) ?? '22:00',
    onboardingComplete: _prefs.getBool(_keyOnboarding) ?? false,
    themeMode: _prefs.getString(_keyTheme) ?? 'dark',
  );

  Future<void> save(AppSettings settings) async {
    await Future.wait([
      _prefs.setInt(_keyFrequency, settings.notificationFrequency),
      _prefs.setString(_keyWakeStart, settings.wakeWindowStart),
      _prefs.setString(_keyWakeEnd, settings.wakeWindowEnd),
      _prefs.setBool(_keyOnboarding, settings.onboardingComplete),
      _prefs.setString(_keyTheme, settings.themeMode),
    ]);
  }

  Future<void> setOnboardingComplete(bool value) async => _prefs.setBool(_keyOnboarding, value);
  Future<void> setNotificationFrequency(int frequency) async => _prefs.setInt(_keyFrequency, frequency);
  Future<void> setWakeWindow(String start, String end) async {
    await Future.wait([
      _prefs.setString(_keyWakeStart, start),
      _prefs.setString(_keyWakeEnd, end),
    ]);
  }
}
