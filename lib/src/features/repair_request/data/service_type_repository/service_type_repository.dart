import 'package:bato_mechanic/src/features/repair_request/data/service_type_repository/api_service_type_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ServiceTypeRepository {
  Future<dynamic> fetchAllServiceTypes();
}

final serviceTypeRepositoryProvider = Provider<ServiceTypeRepository>((ref) {
  // return FakeServiceTypeRepository();
  return APIServiceTypeRepository(ref);
});
