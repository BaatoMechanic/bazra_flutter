// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_track_mechanic_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchRepairRequestHash() =>
    r'ec6de86234945cff2dca5fc86313c0557763d562';

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

/// See also [watchRepairRequest].
@ProviderFor(watchRepairRequest)
const watchRepairRequestProvider = WatchRepairRequestFamily();

/// See also [watchRepairRequest].
class WatchRepairRequestFamily
    extends Family<AsyncValue<VehicleRepairRequest>> {
  /// See also [watchRepairRequest].
  const WatchRepairRequestFamily();

  /// See also [watchRepairRequest].
  WatchRepairRequestProvider call(
    String repairRequestIdx,
  ) {
    return WatchRepairRequestProvider(
      repairRequestIdx,
    );
  }

  @override
  WatchRepairRequestProvider getProviderOverride(
    covariant WatchRepairRequestProvider provider,
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
  String? get name => r'watchRepairRequestProvider';
}

/// See also [watchRepairRequest].
class WatchRepairRequestProvider
    extends AutoDisposeStreamProvider<VehicleRepairRequest> {
  /// See also [watchRepairRequest].
  WatchRepairRequestProvider(
    String repairRequestIdx,
  ) : this._internal(
          (ref) => watchRepairRequest(
            ref as WatchRepairRequestRef,
            repairRequestIdx,
          ),
          from: watchRepairRequestProvider,
          name: r'watchRepairRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchRepairRequestHash,
          dependencies: WatchRepairRequestFamily._dependencies,
          allTransitiveDependencies:
              WatchRepairRequestFamily._allTransitiveDependencies,
          repairRequestIdx: repairRequestIdx,
        );

  WatchRepairRequestProvider._internal(
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
    Stream<VehicleRepairRequest> Function(WatchRepairRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchRepairRequestProvider._internal(
        (ref) => create(ref as WatchRepairRequestRef),
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
  AutoDisposeStreamProviderElement<VehicleRepairRequest> createElement() {
    return _WatchRepairRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchRepairRequestProvider &&
        other.repairRequestIdx == repairRequestIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repairRequestIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchRepairRequestRef
    on AutoDisposeStreamProviderRef<VehicleRepairRequest> {
  /// The parameter `repairRequestIdx` of this provider.
  String get repairRequestIdx;
}

class _WatchRepairRequestProviderElement
    extends AutoDisposeStreamProviderElement<VehicleRepairRequest>
    with WatchRepairRequestRef {
  _WatchRepairRequestProviderElement(super.provider);

  @override
  String get repairRequestIdx =>
      (origin as WatchRepairRequestProvider).repairRequestIdx;
}

String _$watchRepairRequestMechanicLocationHash() =>
    r'1144c2fa014a31b218159e50ba3870a820974f6a';

/// See also [watchRepairRequestMechanicLocation].
@ProviderFor(watchRepairRequestMechanicLocation)
const watchRepairRequestMechanicLocationProvider =
    WatchRepairRequestMechanicLocationFamily();

/// See also [watchRepairRequestMechanicLocation].
class WatchRepairRequestMechanicLocationFamily
    extends Family<AsyncValue<UserPosition>> {
  /// See also [watchRepairRequestMechanicLocation].
  const WatchRepairRequestMechanicLocationFamily();

  /// See also [watchRepairRequestMechanicLocation].
  WatchRepairRequestMechanicLocationProvider call(
    String repairRequestIdx,
  ) {
    return WatchRepairRequestMechanicLocationProvider(
      repairRequestIdx,
    );
  }

  @override
  WatchRepairRequestMechanicLocationProvider getProviderOverride(
    covariant WatchRepairRequestMechanicLocationProvider provider,
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
  String? get name => r'watchRepairRequestMechanicLocationProvider';
}

/// See also [watchRepairRequestMechanicLocation].
class WatchRepairRequestMechanicLocationProvider
    extends AutoDisposeStreamProvider<UserPosition> {
  /// See also [watchRepairRequestMechanicLocation].
  WatchRepairRequestMechanicLocationProvider(
    String repairRequestIdx,
  ) : this._internal(
          (ref) => watchRepairRequestMechanicLocation(
            ref as WatchRepairRequestMechanicLocationRef,
            repairRequestIdx,
          ),
          from: watchRepairRequestMechanicLocationProvider,
          name: r'watchRepairRequestMechanicLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchRepairRequestMechanicLocationHash,
          dependencies: WatchRepairRequestMechanicLocationFamily._dependencies,
          allTransitiveDependencies: WatchRepairRequestMechanicLocationFamily
              ._allTransitiveDependencies,
          repairRequestIdx: repairRequestIdx,
        );

  WatchRepairRequestMechanicLocationProvider._internal(
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
    Stream<UserPosition> Function(
            WatchRepairRequestMechanicLocationRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchRepairRequestMechanicLocationProvider._internal(
        (ref) => create(ref as WatchRepairRequestMechanicLocationRef),
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
  AutoDisposeStreamProviderElement<UserPosition> createElement() {
    return _WatchRepairRequestMechanicLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchRepairRequestMechanicLocationProvider &&
        other.repairRequestIdx == repairRequestIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repairRequestIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchRepairRequestMechanicLocationRef
    on AutoDisposeStreamProviderRef<UserPosition> {
  /// The parameter `repairRequestIdx` of this provider.
  String get repairRequestIdx;
}

class _WatchRepairRequestMechanicLocationProviderElement
    extends AutoDisposeStreamProviderElement<UserPosition>
    with WatchRepairRequestMechanicLocationRef {
  _WatchRepairRequestMechanicLocationProviderElement(super.provider);

  @override
  String get repairRequestIdx =>
      (origin as WatchRepairRequestMechanicLocationProvider).repairRequestIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
