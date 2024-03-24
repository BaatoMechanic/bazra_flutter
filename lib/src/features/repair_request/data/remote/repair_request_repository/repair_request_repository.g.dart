// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_request_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repairRequestRepositoryHash() =>
    r'cc868505037b889dd0cbf806aabadd462821ddf0';

/// See also [repairRequestRepository].
@ProviderFor(repairRequestRepository)
final repairRequestRepositoryProvider =
    AutoDisposeProvider<RepairRequestRepository>.internal(
  repairRequestRepository,
  name: r'repairRequestRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repairRequestRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepairRequestRepositoryRef
    = AutoDisposeProviderRef<RepairRequestRepository>;
String _$fetchUserRepairRequestHash() =>
    r'721b2da17adf3539c84f416b801a91e6b2c56aab';

/// See also [fetchUserRepairRequest].
@ProviderFor(fetchUserRepairRequest)
final fetchUserRepairRequestProvider =
    AutoDisposeFutureProvider<List<VehicleRepairRequest>>.internal(
  fetchUserRepairRequest,
  name: r'fetchUserRepairRequestProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchUserRepairRequestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchUserRepairRequestRef
    = AutoDisposeFutureProviderRef<List<VehicleRepairRequest>>;
String _$fetchVechicleRepairRequestHash() =>
    r'9cd6137f490e7b1b5977769d79c904b57b56ce95';

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

/// See also [fetchVechicleRepairRequest].
@ProviderFor(fetchVechicleRepairRequest)
const fetchVechicleRepairRequestProvider = FetchVechicleRepairRequestFamily();

/// See also [fetchVechicleRepairRequest].
class FetchVechicleRepairRequestFamily
    extends Family<AsyncValue<VehicleRepairRequest>> {
  /// See also [fetchVechicleRepairRequest].
  const FetchVechicleRepairRequestFamily();

  /// See also [fetchVechicleRepairRequest].
  FetchVechicleRepairRequestProvider call(
    String repairRequestIdx,
  ) {
    return FetchVechicleRepairRequestProvider(
      repairRequestIdx,
    );
  }

  @override
  FetchVechicleRepairRequestProvider getProviderOverride(
    covariant FetchVechicleRepairRequestProvider provider,
  ) {
    return call(
      provider.repairRequestIdx,
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
  String? get name => r'fetchVechicleRepairRequestProvider';
}

/// See also [fetchVechicleRepairRequest].
class FetchVechicleRepairRequestProvider
    extends AutoDisposeFutureProvider<VehicleRepairRequest> {
  /// See also [fetchVechicleRepairRequest].
  FetchVechicleRepairRequestProvider(
    String repairRequestIdx,
  ) : this._internal(
          (ref) => fetchVechicleRepairRequest(
            ref as FetchVechicleRepairRequestRef,
            repairRequestIdx,
          ),
          from: fetchVechicleRepairRequestProvider,
          name: r'fetchVechicleRepairRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchVechicleRepairRequestHash,
          dependencies: FetchVechicleRepairRequestFamily._dependencies,
          allTransitiveDependencies:
              FetchVechicleRepairRequestFamily._allTransitiveDependencies,
          repairRequestIdx: repairRequestIdx,
        );

  FetchVechicleRepairRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repairRequestIdx,
  }) : super.internal();

  final String repairRequestIdx;

  @override
  Override overrideWith(
    FutureOr<VehicleRepairRequest> Function(
            FetchVechicleRepairRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchVechicleRepairRequestProvider._internal(
        (ref) => create(ref as FetchVechicleRepairRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repairRequestIdx: repairRequestIdx,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<VehicleRepairRequest> createElement() {
    return _FetchVechicleRepairRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchVechicleRepairRequestProvider &&
        other.repairRequestIdx == repairRequestIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repairRequestIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchVechicleRepairRequestRef
    on AutoDisposeFutureProviderRef<VehicleRepairRequest> {
  /// The parameter `repairRequestIdx` of this provider.
  String get repairRequestIdx;
}

class _FetchVechicleRepairRequestProviderElement
    extends AutoDisposeFutureProviderElement<VehicleRepairRequest>
    with FetchVechicleRepairRequestRef {
  _FetchVechicleRepairRequestProviderElement(super.provider);

  @override
  String get repairRequestIdx =>
      (origin as FetchVechicleRepairRequestProvider).repairRequestIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
