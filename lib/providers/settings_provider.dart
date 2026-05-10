import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moon_manifest/data/models/app_settings.dart';
import 'package:moon_manifest/data/repositories/settings_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Must be overridden in ProviderScope');
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(sharedPreferencesProvider));
});

final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  final repo = ref.watch(settingsRepositoryProvider);
  return SettingsNotifier(repo);
});

class SettingsNotifier extends StateNotifier<AppSettings> {
  final SettingsRepository _repo;
  SettingsNotifier(this._repo) : super(_repo.load());

  Future<void> setOnboardingComplete() async {
    await _repo.setOnboardingComplete(true);
    state = state.copyWith(onboardingComplete: true);
  }

  Future<void> setNotificationFrequency(int frequency) async {
    await _repo.setNotificationFrequency(frequency);
    state = state.copyWith(notificationFrequency: frequency);
  }

  Future<void> setWakeWindow(String start, String end) async {
    await _repo.setWakeWindow(start, end);
    state = state.copyWith(wakeWindowStart: start, wakeWindowEnd: end);
  }

  Future<void> setMoonStyle(String style) async {
    await _repo.setMoonStyle(style);
    state = state.copyWith(moonStyle: style);
  }

  Future<void> updateSettings(AppSettings settings) async {
    await _repo.save(settings);
    state = settings;
  }
}
