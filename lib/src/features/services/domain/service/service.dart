import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../utils/enums/service_type_options.dart';

part 'service.freezed.dart';
part 'service.g.dart';

class IconDataConverter implements JsonConverter<IconData?, String?> {
  const IconDataConverter();

  @override
  IconData? fromJson(String? json) =>
      json != null ? IconData(json.codeUnitAt(0)) : null;

  @override
  String? toJson(IconData? iconData) =>
      iconData != null ? String.fromCharCode(iconData.codePoint) : null;
}

List<Service> servicesFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => Service.fromJson(json)).toList();
}

@freezed
class Service with _$Service {
  @IconDataConverter()
  const factory Service({
    required String idx,
    required String name,
    required ServiceTypeOption type,
    required IconData? icon,
    @JsonKey(name: 'parts_included') required List<String> partsIncludedIdx,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
