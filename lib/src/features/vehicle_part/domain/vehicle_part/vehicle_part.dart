import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_part.freezed.dart';
part 'vehicle_part.g.dart';

List<VehiclePart> vehiclePartsFromJson(List<dynamic> jsonList) =>
    jsonList.map((item) => VehiclePart.fromJson(item)).toList();

@freezed
class VehiclePart with _$VehiclePart {
  const factory VehiclePart({
    required String idx,
    required String name,
    @JsonKey(name: "vehicle_category_idx") required String vehicleCategoryIdx,
    String? image,
    @JsonKey(name: "is_multiple") required bool isMultiple,
    String? position,
  }) = _VehiclePart;

  factory VehiclePart.fromJson(Map<String, dynamic> json) =>
      _$VehiclePartFromJson(json);
}
