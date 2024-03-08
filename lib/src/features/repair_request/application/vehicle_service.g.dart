// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehicleServiceHash() => r'2c1e1d32e546436cd28a1f9d92e5fbd32aa84df6';

/// See also [vehicleService].
@ProviderFor(vehicleService)
final vehicleServiceProvider = AutoDisposeProvider<VehiclesService>.internal(
  vehicleService,
  name: r'vehicleServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VehicleServiceRef = AutoDisposeProviderRef<VehiclesService>;
String _$fetchVehiclesByCategoryHash() =>
    r'ff539087139c492087bcfc95645950f125e6484a';

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

/// See also [fetchVehiclesByCategory].
@ProviderFor(fetchVehiclesByCategory)
const fetchVehiclesByCategoryProvider = FetchVehiclesByCategoryFamily();

/// See also [fetchVehiclesByCategory].
class FetchVehiclesByCategoryFamily extends Family<AsyncValue<List<Vehicle>>> {
  /// See also [fetchVehiclesByCategory].
  const FetchVehiclesByCategoryFamily();

  /// See also [fetchVehiclesByCategory].
  FetchVehiclesByCategoryProvider call(
    String categoryId,
  ) {
    return FetchVehiclesByCategoryProvider(
      categoryId,
    );
  }

  @override
  FetchVehiclesByCategoryProvider getProviderOverride(
    covariant FetchVehiclesByCategoryProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'fetchVehiclesByCategoryProvider';
}

/// See also [fetchVehiclesByCategory].
class FetchVehiclesByCategoryProvider
    extends AutoDisposeFutureProvider<List<Vehicle>> {
  /// See also [fetchVehiclesByCategory].
  FetchVehiclesByCategoryProvider(
    String categoryId,
  ) : this._internal(
          (ref) => fetchVehiclesByCategory(
            ref as FetchVehiclesByCategoryRef,
            categoryId,
          ),
          from: fetchVehiclesByCategoryProvider,
          name: r'fetchVehiclesByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchVehiclesByCategoryHash,
          dependencies: FetchVehiclesByCategoryFamily._dependencies,
          allTransitiveDependencies:
              FetchVehiclesByCategoryFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  FetchVehiclesByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<List<Vehicle>> Function(FetchVehiclesByCategoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchVehiclesByCategoryProvider._internal(
        (ref) => create(ref as FetchVehiclesByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Vehicle>> createElement() {
    return _FetchVehiclesByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchVehiclesByCategoryProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchVehiclesByCategoryRef
    on AutoDisposeFutureProviderRef<List<Vehicle>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _FetchVehiclesByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Vehicle>>
    with FetchVehiclesByCategoryRef {
  _FetchVehiclesByCategoryProviderElement(super.provider);

  @override
  String get categoryId =>
      (origin as FetchVehiclesByCategoryProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
