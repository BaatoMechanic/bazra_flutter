// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serviceTypeRepositoryHash() =>
    r'f34440f80c0e039285dd6949f4332864f78b4298';

/// See also [serviceTypeRepository].
@ProviderFor(serviceTypeRepository)
final serviceTypeRepositoryProvider =
    AutoDisposeProvider<ServiceTypeRepository>.internal(
  serviceTypeRepository,
  name: r'serviceTypeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serviceTypeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ServiceTypeRepositoryRef
    = AutoDisposeProviderRef<ServiceTypeRepository>;
String _$fetchAllServiceTypesHash() =>
    r'4151ee8cdcd6382d1ce51d66dcf43e014c532932';

/// See also [fetchAllServiceTypes].
@ProviderFor(fetchAllServiceTypes)
final fetchAllServiceTypesProvider =
    AutoDisposeFutureProvider<List<Service>>.internal(
  fetchAllServiceTypes,
  name: r'fetchAllServiceTypesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllServiceTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAllServiceTypesRef = AutoDisposeFutureProviderRef<List<Service>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
