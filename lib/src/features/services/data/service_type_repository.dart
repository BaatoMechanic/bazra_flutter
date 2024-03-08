import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/services/data/api_service_type_repository.dart';
import 'package:bato_mechanic/src/features/services/domain/service/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_service_type_repository.dart';

abstract class ServiceTypeRepository {
  Future<List<Service>> fetchAllServiceTypes();
  Future<Service> fetchRepairRequestServiceType(String repairRequestIdx);
}

final serviceTypeRepositoryProvider = Provider<ServiceTypeRepository>((ref) {
  if (SHOW_FAKE) return FakeServiceTypeRepository();
  return APIServiceTypeRepository(ref);
});

final fetchAllServiceTypeProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(serviceTypeRepositoryProvider).fetchAllServiceTypes());
