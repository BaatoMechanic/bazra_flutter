// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationServiceHash() => r'dfa090e0ae006e5486f3e74a8794dd3b1ad8321b';

/// See also [locationService].
@ProviderFor(locationService)
final locationServiceProvider = AutoDisposeProvider<LocationService>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationServiceRef = AutoDisposeProviderRef<LocationService>;
String _$userCurrentLocationHash() =>
    r'e383680fe57513e93a3f95802561a6901e6f44a4';

/// See also [userCurrentLocation].
@ProviderFor(userCurrentLocation)
final userCurrentLocationProvider =
    AutoDisposeFutureProvider<UserPosition?>.internal(
  userCurrentLocation,
  name: r'userCurrentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userCurrentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserCurrentLocationRef = AutoDisposeFutureProviderRef<UserPosition?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
