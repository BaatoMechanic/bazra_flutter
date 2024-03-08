import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_category.freezed.dart';
part 'vehicle_category.g.dart';

List<VehicleCategory> vehicleCategoriesFromJson(List<dynamic> jsonList) =>
    jsonList.map((item) => VehicleCategory.fromJson(item)).toList();

@freezed
class VehicleCategory with _$VehicleCategory {
  const factory VehicleCategory({
    required String idx,
    required String name,
    required String image,
  }) = _VehicleCategory;

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      _$VehicleCategoryFromJson(json);
}
