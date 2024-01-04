import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserSettingsRepository {
  const UserSettingsRepository(this.ref);
  final Ref ref;

  // synchronous read
  bool onboardingComplete() {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    return sharedPreferences.getBool('onboardingComplete') ?? false;
  }

  // asynchronous write
  Future<void> setOnboardingComplete(bool complete) {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    return sharedPreferences.setBool('onboardingComplete', complete);
  }

  ThemeMode getThemeMode() {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == sharedPreferences.getString('themeMode'),
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode themeMode) {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    ref.read(themeModeProvider.notifier).state = themeMode;
    return sharedPreferences.setString('themeMode', themeMode.name);
  }
}

final userSettingsRepositoryProvider = Provider<UserSettingsRepository>((ref) {
  return UserSettingsRepository(ref);
});

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final userSettingsRepository = ref.watch(userSettingsRepositoryProvider);
  return userSettingsRepository.getThemeMode();
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
