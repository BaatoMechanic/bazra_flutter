// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSettingsRepositoryHash() =>
    r'760e97b2d81f1fbfefcf4463d925ede3f9d9de94';

/// See also [userSettingsRepository].
@ProviderFor(userSettingsRepository)
final userSettingsRepositoryProvider =
    Provider<UserSettingsRepository>.internal(
  userSettingsRepository,
  name: r'userSettingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userSettingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserSettingsRepositoryRef = ProviderRef<UserSettingsRepository>;
String _$sharedPreferencesHash() => r'3a9f8412df34c1653d08100c9826aa2125b80f7f';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = Provider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = ProviderRef<SharedPreferences>;
String _$bThemeModeHash() => r'8a0dac693e6d4674090f725026197d5d3c581aa7';

/// See also [BThemeMode].
@ProviderFor(BThemeMode)
final bThemeModeProvider =
    AutoDisposeNotifierProvider<BThemeMode, ThemeMode>.internal(
  BThemeMode.new,
  name: r'bThemeModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BThemeMode = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
