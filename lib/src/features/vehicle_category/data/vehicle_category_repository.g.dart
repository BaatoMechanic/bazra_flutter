// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_category_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehicleCategoryRepositoryHash() =>
    r'998f59596e22c2b7fd3dc3c0dc0b555ed378f370';

/// See also [vehicleCategoryRepository].
@ProviderFor(vehicleCategoryRepository)
final vehicleCategoryRepositoryProvider =
    AutoDisposeProvider<VehicleCategoryRepository>.internal(
  vehicleCategoryRepository,
  name: r'vehicleCategoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleCategoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VehicleCategoryRepositoryRef
    = AutoDisposeProviderRef<VehicleCategoryRepository>;
String _$fetchVehicleCategoriesForServiceHash() =>
    r'e50bf1de75b1416ddc2312cffb0f65493594ee56';

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

/// See also [fetchVehicleCategoriesForService].
@ProviderFor(fetchVehicleCategoriesForService)
const fetchVehicleCategoriesForServiceProvider =
    FetchVehicleCategoriesForServiceFamily();

/// See also [fetchVehicleCategoriesForService].
class FetchVehicleCategoriesForServiceFamily
    extends Family<AsyncValue<List<VehicleCategory>>> {
  /// See also [fetchVehicleCategoriesForService].
  const FetchVehicleCategoriesForServiceFamily();

  /// See also [fetchVehicleCategoriesForService].
  FetchVehicleCategoriesForServiceProvider call(
    String serviceIdx,
  ) {
    return FetchVehicleCategoriesForServiceProvider(
      serviceIdx,
    );
  }

  @override
  FetchVehicleCategoriesForServiceProvider getProviderOverride(
    covariant FetchVehicleCategoriesForServiceProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchVehicleCategoriesForServiceProvider';
}

/// See also [fetchVehicleCategoriesForService].
class FetchVehicleCategoriesForServiceProvider
    extends AutoDisposeFutureProvider<List<VehicleCategory>> {
  /// See also [fetchVehicleCategoriesForService].
  FetchVehicleCategoriesForServiceProvider(
    String serviceIdx,
  ) : this._internal(
          (ref) => fetchVehicleCategoriesForService(
            ref as FetchVehicleCategoriesForServiceRef,
            serviceIdx,
          ),
          from: fetchVehicleCategoriesForServiceProvider,
          name: r'fetchVehicleCategoriesForServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchVehicleCategoriesForServiceHash,
          dependencies: FetchVehicleCategoriesForServiceFamily._dependencies,
          allTransitiveDependencies:
              FetchVehicleCategoriesForServiceFamily._allTransitiveDependencies,
          serviceIdx: serviceIdx,
        );

  FetchVehicleCategoriesForServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.serviceIdx,
  }) : super.internal();

  final String serviceIdx;

  @override
  Override overrideWith(
    FutureOr<List<VehicleCategory>> Function(
            FetchVehicleCategoriesForServiceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchVehicleCategoriesForServiceProvider._internal(
        (ref) => create(ref as FetchVehicleCategoriesForServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        serviceIdx: serviceIdx,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VehicleCategory>> createElement() {
    return _FetchVehicleCategoriesForServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchVehicleCategoriesForServiceProvider &&
        other.serviceIdx == serviceIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, serviceIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchVehicleCategoriesForServiceRef
    on AutoDisposeFutureProviderRef<List<VehicleCategory>> {
  /// The parameter `serviceIdx` of this provider.
  String get serviceIdx;
}

class _FetchVehicleCategoriesForServiceProviderElement
    extends AutoDisposeFutureProviderElement<List<VehicleCategory>>
    with FetchVehicleCategoriesForServiceRef {
  _FetchVehicleCategoriesForServiceProviderElement(super.provider);

  @override
  String get serviceIdx =>
      (origin as FetchVehicleCategoriesForServiceProvider).serviceIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
