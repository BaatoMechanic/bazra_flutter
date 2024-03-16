// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanic_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mechanicServiceHash() => r'327c6696633de98482b70785270f99b85bc0a820';

/// See also [mechanicService].
@ProviderFor(mechanicService)
final mechanicServiceProvider = AutoDisposeProvider<MechanicService>.internal(
  mechanicService,
  name: r'mechanicServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mechanicServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MechanicServiceRef = AutoDisposeProviderRef<MechanicService>;
String _$fetchMechanicRouteHash() =>
    r'dedc95e9d84cefe3ca37a32592f3f63692b88515';

/// See also [fetchMechanicRoute].
@ProviderFor(fetchMechanicRoute)
final fetchMechanicRouteProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  fetchMechanicRoute,
  name: r'fetchMechanicRouteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMechanicRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMechanicRouteRef
    = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$fetchRecommendedMechanicsHash() =>
    r'b85d403609c28d3f14c4ce9a6cf3699f4f1d77e0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchRecommendedMechanics].
@ProviderFor(fetchRecommendedMechanics)
const fetchRecommendedMechanicsProvider = FetchRecommendedMechanicsFamily();

/// See also [fetchRecommendedMechanics].
class FetchRecommendedMechanicsFamily extends Family<AsyncValue<List<User>>> {
  /// See also [fetchRecommendedMechanics].
  const FetchRecommendedMechanicsFamily();

  /// See also [fetchRecommendedMechanics].
  FetchRecommendedMechanicsProvider call(
    String vehicleCategoryIdx,
    String serviceIdx,
  ) {
    return FetchRecommendedMechanicsProvider(
      vehicleCategoryIdx,
      serviceIdx,
    );
  }

  @override
  FetchRecommendedMechanicsProvider getProviderOverride(
    covariant FetchRecommendedMechanicsProvider provider,
  ) {
    return call(
      provider.vehicleCategoryIdx,
      provider.serviceIdx,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchRecommendedMechanicsProvider';
}

/// See also [fetchRecommendedMechanics].
class FetchRecommendedMechanicsProvider
    extends AutoDisposeFutureProvider<List<User>> {
  /// See also [fetchRecommendedMechanics].
  FetchRecommendedMechanicsProvider(
    String vehicleCategoryIdx,
    String serviceIdx,
  ) : this._internal(
          (ref) => fetchRecommendedMechanics(
            ref as FetchRecommendedMechanicsRef,
            vehicleCategoryIdx,
            serviceIdx,
          ),
          from: fetchRecommendedMechanicsProvider,
          name: r'fetchRecommendedMechanicsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRecommendedMechanicsHash,
          dependencies: FetchRecommendedMechanicsFamily._dependencies,
          allTransitiveDependencies:
              FetchRecommendedMechanicsFamily._allTransitiveDependencies,
          vehicleCategoryIdx: vehicleCategoryIdx,
          serviceIdx: serviceIdx,
        );

  FetchRecommendedMechanicsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vehicleCategoryIdx,
    required this.serviceIdx,
  }) : super.internal();

  final String vehicleCategoryIdx;
  final String serviceIdx;

  @override
  Override overrideWith(
    FutureOr<List<User>> Function(FetchRecommendedMechanicsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRecommendedMechanicsProvider._internal(
        (ref) => create(ref as FetchRecommendedMechanicsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vehicleCategoryIdx: vehicleCategoryIdx,
        serviceIdx: serviceIdx,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<User>> createElement() {
    return _FetchRecommendedMechanicsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRecommendedMechanicsProvider &&
        other.vehicleCategoryIdx == vehicleCategoryIdx &&
        other.serviceIdx == serviceIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vehicleCategoryIdx.hashCode);
    hash = _SystemHash.combine(hash, serviceIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchRecommendedMechanicsRef on AutoDisposeFutureProviderRef<List<User>> {
  /// The parameter `vehicleCategoryIdx` of this provider.
  String get vehicleCategoryIdx;

  /// The parameter `serviceIdx` of this provider.
  String get serviceIdx;
}

class _FetchRecommendedMechanicsProviderElement
    extends AutoDisposeFutureProviderElement<List<User>>
    with FetchRecommendedMechanicsRef {
  _FetchRecommendedMechanicsProviderElement(super.provider);

  @override
  String get vehicleCategoryIdx =>
      (origin as FetchRecommendedMechanicsProvider).vehicleCategoryIdx;
  @override
  String get serviceIdx =>
      (origin as FetchRecommendedMechanicsProvider).serviceIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
