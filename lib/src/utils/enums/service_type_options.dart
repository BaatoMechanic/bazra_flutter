// // ignore_for_file: constant_identifier_names

// enum ServiceTypeOption {
//   BODY_REPAIR,
//   ENGINE_REPAIR,
//   ELECTRICAL_REPAIR,
//   WHEEL_REPAIR,

//   PAINTING,
//   OTHER
// }

// ServiceTypeOption serviceTypeOptionFromJson(String status) {
//   switch (status.toUpperCase()) {
//     case "BODY_REPAIR":
//       return ServiceTypeOption.BODY_REPAIR;
//     case "ENGINE_REPAIR":
//       return ServiceTypeOption.ENGINE_REPAIR;
//     case "ELECTRICAL_REPAIR":
//       return ServiceTypeOption.ELECTRICAL_REPAIR;
//     case "WHEEL_REPAIR":
//       return ServiceTypeOption.WHEEL_REPAIR;
//     case "PAINTING":
//       return ServiceTypeOption.PAINTING;
//     case "OTHER":
//       return ServiceTypeOption.OTHER;
//     default:
//       return ServiceTypeOption.OTHER;
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';

enum ServiceTypeOption {
  @JsonValue('body_repair')
  BODY_REPAIR,
  @JsonValue('engine_repair')
  ENGINE_REPAIR,
  @JsonValue('electrical_repair')
  ELECTRICAL_REPAIR,
  @JsonValue('wheel_repair')
  WHEEL_REPAIR,
  @JsonValue('painting')
  PAINTING,
  @JsonValue('other')
  OTHER
}
