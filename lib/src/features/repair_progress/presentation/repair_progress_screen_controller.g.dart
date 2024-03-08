// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_progress_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRepairStepsHash() => r'd11634ead376716822b76394687934990d50b6ef';

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

/// See also [fetchRepairSteps].
@ProviderFor(fetchRepairSteps)
const fetchRepairStepsProvider = FetchRepairStepsFamily();

/// See also [fetchRepairSteps].
class FetchRepairStepsFamily extends Family<AsyncValue<List<RepairStep>>> {
  /// See also [fetchRepairSteps].
  const FetchRepairStepsFamily();

  /// See also [fetchRepairSteps].
  FetchRepairStepsProvider call(
    String repairStepIdx,
  ) {
    return FetchRepairStepsProvider(
      repairStepIdx,
    );
  }

  @override
  FetchRepairStepsProvider getProviderOverride(
    covariant FetchRepairStepsProvider provider,
  ) {
    return call(
      provider.repairStepIdx,
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
  String? get name => r'fetchRepairStepsProvider';
}

/// See also [fetchRepairSteps].
class FetchRepairStepsProvider
    extends AutoDisposeFutureProvider<List<RepairStep>> {
  /// See also [fetchRepairSteps].
  FetchRepairStepsProvider(
    String repairStepIdx,
  ) : this._internal(
          (ref) => fetchRepairSteps(
            ref as FetchRepairStepsRef,
            repairStepIdx,
          ),
          from: fetchRepairStepsProvider,
          name: r'fetchRepairStepsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRepairStepsHash,
          dependencies: FetchRepairStepsFamily._dependencies,
          allTransitiveDependencies:
              FetchRepairStepsFamily._allTransitiveDependencies,
          repairStepIdx: repairStepIdx,
        );

  FetchRepairStepsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repairStepIdx,
  }) : super.internal();

  final String repairStepIdx;

  @override
  Override overrideWith(
    FutureOr<List<RepairStep>> Function(FetchRepairStepsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRepairStepsProvider._internal(
        (ref) => create(ref as FetchRepairStepsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repairStepIdx: repairStepIdx,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RepairStep>> createElement() {
    return _FetchRepairStepsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRepairStepsProvider &&
        other.repairStepIdx == repairStepIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repairStepIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchRepairStepsRef on AutoDisposeFutureProviderRef<List<RepairStep>> {
  /// The parameter `repairStepIdx` of this provider.
  String get repairStepIdx;
}

class _FetchRepairStepsProviderElement
    extends AutoDisposeFutureProviderElement<List<RepairStep>>
    with FetchRepairStepsRef {
  _FetchRepairStepsProviderElement(super.provider);

  @override
  String get repairStepIdx =>
      (origin as FetchRepairStepsProvider).repairStepIdx;
}

String _$repairProgressScreenControllerHash() =>
    r'dc764651236ae51ef431d6bc54f08be27366de84';

/// See also [RepairProgressScreenController].
@ProviderFor(RepairProgressScreenController)
final repairProgressScreenControllerProvider = AutoDisposeAsyncNotifierProvider<
    RepairProgressScreenController, void>.internal(
  RepairProgressScreenController.new,
  name: r'repairProgressScreenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repairProgressScreenControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RepairProgressScreenController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
