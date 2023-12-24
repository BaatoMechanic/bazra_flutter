// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/vehicle_category.dart';

class VehicleCategoryState {
  VehicleCategoryState({
    this.vehicleCategories = const AsyncValue.data([]),
    this.selectedCategory,
  });
  final AsyncValue<List<VehicleCategory>> vehicleCategories;
  final VehicleCategory? selectedCategory;

  VehicleCategoryState copyWith({
    AsyncValue<List<VehicleCategory>>? vehicleCategories,
    VehicleCategory? selectedCategory,
  }) {
    return VehicleCategoryState(
      vehicleCategories: vehicleCategories ?? this.vehicleCategories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  String toString() =>
      'VehicleCategoryState(vehicleCategories: $vehicleCategories, selectedCategory: $selectedCategory)';

  @override
  bool operator ==(covariant VehicleCategoryState other) {
    if (identical(this, other)) return true;

    return other.vehicleCategories == vehicleCategories &&
        other.selectedCategory == selectedCategory;
  }

  @override
  int get hashCode => vehicleCategories.hashCode ^ selectedCategory.hashCode;
}
