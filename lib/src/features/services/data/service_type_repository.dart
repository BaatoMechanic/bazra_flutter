import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/services/data/api_service_type_repository.dart';
import 'package:bato_mechanic/src/features/services/domain/service/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_service_type_repository.dart';

part 'service_type_repository.g.dart';

abstract class ServiceTypeRepository {
  Future<List<Service>> fetchAllServiceTypes();
  Future<Service> fetchRepairRequestServiceType(String repairRequestIdx);
}

@riverpod
ServiceTypeRepository serviceTypeRepository(ServiceTypeRepositoryRef ref) =>
    SHOW_FAKE ? FakeServiceTypeRepository() : APIServiceTypeRepository(ref);

@riverpod
Future<List<Service>> fetchAllServiceTypes(FetchAllServiceTypesRef ref) {
  return ref.watch(serviceTypeRepositoryProvider).fetchAllServiceTypes();
}

@riverpod
Future<Service> fetchRepairRequestServiceType(
        FetchRepairRequestServiceTypeRef ref, String repairRequestIdx) =>
    ref
        .watch(serviceTypeRepositoryProvider)
        .fetchRepairRequestServiceType(repairRequestIdx);
