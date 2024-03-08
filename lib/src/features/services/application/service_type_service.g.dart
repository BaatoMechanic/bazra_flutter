// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRepairRequestServiceTypeHash() =>
    r'20cfdca15e42a4b849ad4c002e47da0fc5e2786c';

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

/// See also [fetchRepairRequestServiceType].
@ProviderFor(fetchRepairRequestServiceType)
const fetchRepairRequestServiceTypeProvider =
    FetchRepairRequestServiceTypeFamily();

/// See also [fetchRepairRequestServiceType].
class FetchRepairRequestServiceTypeFamily extends Family<AsyncValue<Service>> {
  /// See also [fetchRepairRequestServiceType].
  const FetchRepairRequestServiceTypeFamily();

  /// See also [fetchRepairRequestServiceType].
  FetchRepairRequestServiceTypeProvider call(
    String repairRequestIdx,
  ) {
    return FetchRepairRequestServiceTypeProvider(
      repairRequestIdx,
    );
  }

  @override
  FetchRepairRequestServiceTypeProvider getProviderOverride(
    covariant FetchRepairRequestServiceTypeProvider provider,
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
  String? get name => r'fetchRepairRequestServiceTypeProvider';
}

/// See also [fetchRepairRequestServiceType].
class FetchRepairRequestServiceTypeProvider
    extends AutoDisposeFutureProvider<Service> {
  /// See also [fetchRepairRequestServiceType].
  FetchRepairRequestServiceTypeProvider(
    String repairRequestIdx,
  ) : this._internal(
          (ref) => fetchRepairRequestServiceType(
            ref as FetchRepairRequestServiceTypeRef,
            repairRequestIdx,
          ),
          from: fetchRepairRequestServiceTypeProvider,
          name: r'fetchRepairRequestServiceTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRepairRequestServiceTypeHash,
          dependencies: FetchRepairRequestServiceTypeFamily._dependencies,
          allTransitiveDependencies:
              FetchRepairRequestServiceTypeFamily._allTransitiveDependencies,
          repairRequestIdx: repairRequestIdx,
        );

  FetchRepairRequestServiceTypeProvider._internal(
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
    FutureOr<Service> Function(FetchRepairRequestServiceTypeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRepairRequestServiceTypeProvider._internal(
        (ref) => create(ref as FetchRepairRequestServiceTypeRef),
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
  AutoDisposeFutureProviderElement<Service> createElement() {
    return _FetchRepairRequestServiceTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRepairRequestServiceTypeProvider &&
        other.repairRequestIdx == repairRequestIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repairRequestIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchRepairRequestServiceTypeRef
    on AutoDisposeFutureProviderRef<Service> {
  /// The parameter `repairRequestIdx` of this provider.
  String get repairRequestIdx;
}

class _FetchRepairRequestServiceTypeProviderElement
    extends AutoDisposeFutureProviderElement<Service>
    with FetchRepairRequestServiceTypeRef {
  _FetchRepairRequestServiceTypeProviderElement(super.provider);

  @override
  String get repairRequestIdx =>
      (origin as FetchRepairRequestServiceTypeProvider).repairRequestIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
