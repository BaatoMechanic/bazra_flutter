// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../data/vehicle_category_repository.dart';

class VehicleCategoryService {
  VehicleCategoryService({
    required this.ref,
  });
  final Ref ref;
}

final vehicleCategoryServiceProvider = Provider((ref) {
  final serviceProvider = VehicleCategoryService(ref: ref);

  return serviceProvider;
});

final fetchVehicleCategoriesForService = FutureProvider.autoDispose
    .family<List<VehicleCategory>, String>((ref, serviceIdx) {
  return ref
      .watch(vehicleCategoryRepositoryProvider)
      .fetchVehicleCategoriesForService(serviceIdx);
});
