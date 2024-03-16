import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_settings.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
class UserSettings extends _$UserSettings {
  @override
  dynamic build() {
    // nothing to do
  }

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

@riverpod
class BThemeMode extends _$BThemeMode {
  @override
  ThemeMode build() {
    final userSettings = ref.watch(userSettingsProvider.notifier);
    return userSettings.getThemeMode();
  }

  Future<void> setThemeMode(ThemeMode themeMode) {
    final SharedPreferences sharedPreferences =
        ref.read<SharedPreferences>(sharedPreferencesProvider);
    state = themeMode;
    return sharedPreferences.setString('themeMode', themeMode.name);
  }
}
