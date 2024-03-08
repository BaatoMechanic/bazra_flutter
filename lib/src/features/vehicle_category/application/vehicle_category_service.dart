// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category/vehicle_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/vehicle_category_repository.dart';

part 'vehicle_category_service.g.dart';

@riverpod
Future<List<VehicleCategory>> fetchVehicleCategoriesForService(
    FetchVehicleCategoriesForServiceRef ref, String serviceIdx) {
  return ref
      .watch(vehicleCategoryRepositoryProvider)
      .fetchVehicleCategoriesForService(serviceIdx);
}
