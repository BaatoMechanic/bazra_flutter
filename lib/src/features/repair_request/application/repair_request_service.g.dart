// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_request_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repairRequestServiceHash() =>
    r'8a44a3f29b7e86a95d66c5dbdfa77232b10f6be8';

/// See also [repairRequestService].
@ProviderFor(repairRequestService)
final repairRequestServiceProvider =
    AutoDisposeProvider<RepairRequestService>.internal(
  repairRequestService,
  name: r'repairRequestServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repairRequestServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepairRequestServiceRef = AutoDisposeProviderRef<RepairRequestService>;
String _$activeRepairRequestHash() =>
    r'5955f58c647f09278b79cf845b1d3f6de0670cb2';

/// See also [ActiveRepairRequest].
@ProviderFor(ActiveRepairRequest)
final activeRepairRequestProvider = AutoDisposeNotifierProvider<
    ActiveRepairRequest, VehicleRepairRequest?>.internal(
  ActiveRepairRequest.new,
  name: r'activeRepairRequestProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeRepairRequestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveRepairRequest = AutoDisposeNotifier<VehicleRepairRequest?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
