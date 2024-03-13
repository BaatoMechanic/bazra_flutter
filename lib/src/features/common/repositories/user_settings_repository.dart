import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_settings_repository.g.dart';

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
}

@Riverpod(keepAlive: true)
UserSettingsRepository userSettingsRepository(UserSettingsRepositoryRef ref) =>
    UserSettingsRepository(ref);

@riverpod
class BThemeMode extends _$BThemeMode {
  @override
  ThemeMode build() {
    final userSettingsRepository = ref.watch(userSettingsRepositoryProvider);
    return userSettingsRepository.getThemeMode();
  }

  Future<void> setThemeMode(ThemeMode themeMode) {
    final SharedPreferences sharedPreferences =
        ref.read<SharedPreferences>(sharedPreferencesProvider);
    state = themeMode;
    return sharedPreferences.setString('themeMode', themeMode.name);
  }
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}
