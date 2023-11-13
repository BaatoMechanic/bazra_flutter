// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_part_repository/vehicle_parts_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_repository/vehicle_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../../../common/domain/service_type.dart';
import '../data/vehicle_category_repository/vehicle_category_repository.dart';
import '../domain/vehicle.dart';
import '../domain/vehicle_part.dart';

class SerivceTypeService {
  SerivceTypeService({
    required this.ref,
  });
  final _selectedServiceTypeState = InMemoryStore<ServiceType?>(null);
  final Ref ref;

  Stream<ServiceType?> _selectedServiceTypeStateChanges() =>
      _selectedServiceTypeState.stream;
  ServiceType? get selectedServiceType => _selectedServiceTypeState.value;

  void setSelectedServiceType(ServiceType serviceType) {
    _selectedServiceTypeState.value = serviceType;
  }

  Future<List<ServiceType>> fetchSerivceTypesForVehicle(
      String vehicleId) async {
    final response = await ref
        .watch(vehiclePartsRepositoryProvider)
        .fetchVehicleParts(vehicleId);

    if (response is Success) {
      return response.response as List<ServiceType>;
    }
    if (response is Failure) {
      throw Exception('Something went wrong'.hardcoded());
    }
    return [];
  }

  void dispose() => _selectedServiceTypeState.close();
}

final serviceTypeServiceProvider = Provider((ref) {
  final serviceProvider = SerivceTypeService(ref: ref);
  ref.onDispose(() => serviceProvider.dispose());
  return serviceProvider;
});

final watchSelectedServiceTypeProvider = StreamProvider<ServiceType?>((ref) {
  final serviceProvider = ref.watch(serviceTypeServiceProvider);
  return serviceProvider._selectedServiceTypeStateChanges();
});
