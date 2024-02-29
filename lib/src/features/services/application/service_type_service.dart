// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bato_mechanic/src/features/services/data/service_type_repository.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/vehicle_part/data/vehicle_parts_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/service/service.dart';

class SerivceTypeService {
  SerivceTypeService({
    required this.ref,
  });
  final Ref ref;

  // final _selectedServiceTypeState = InMemoryStore<ServiceType?>(null);
  // final _allServiceTypeState = InMemoryStore<List<ServiceType>>([]);

  // Stream<ServiceType?> _selectedServiceTypeStateChanges() =>
  //     _selectedServiceTypeState.stream;
  // ServiceType? get selectedServiceType => _selectedServiceTypeState.value;

  // void setSelectedServiceType(ServiceType serviceType) {
  //   _selectedServiceTypeState.value = serviceType;
  // }

  // Stream<List<ServiceType>> _allServiceTypeStateChanges() =>
  //     _allServiceTypeState.stream;
  // List<ServiceType> get allServiceType => _allServiceTypeState.value;

  Future<List<Service>> fetchSerivceTypesForVehicle(String vehicleId) async {
    final response = await ref
        .watch(vehiclePartsRepositoryProvider)
        .fetchVehicleParts(vehicleId);

    if (response is Success) {
      return response.response as List<Service>;
    }
    if (response is Failure) {
      throw Exception('Something went wrong'.hardcoded());
    }
    return [];
  }

  // void dispose() => _selectedServiceTypeState.close();
}

final serviceTypeServiceProvider = Provider((ref) {
  final serviceProvider = SerivceTypeService(ref: ref);
  return serviceProvider;
});

final fetchRepairRequestServiceProvider = FutureProvider.autoDispose
    .family<Service, String>((ref, repairRequestIdx) => ref
        .watch(serviceTypeRepositoryProvider)
        .fetchRepairRequestServiceType(repairRequestIdx));

// final watchSelectedServiceTypeProvider = StreamProvider<ServiceType?>((ref) {
//   final serviceProvider = ref.watch(serviceTypeServiceProvider);
//   return serviceProvider._selectedServiceTypeStateChanges();
// });

// final watchAllServiceTypeProvider = StreamProvider<List<ServiceType>>((ref) {
//   final serviceProvider = ref.watch(serviceTypeServiceProvider);
//   return serviceProvider._allServiceTypeStateChanges();
// });
