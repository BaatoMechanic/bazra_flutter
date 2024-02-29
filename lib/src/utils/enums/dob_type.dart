// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

enum DOBType {
  @JsonValue("bs")
  BS,

  @JsonValue("ad")
  AD,
}

// enum DOBType { BS, AD }

// DOBType dobTypeFromJson(String type) {
//   switch (type.toUpperCase()) {
//     case "AD":
//       return DOBType.AD;
//     case "BS":
//       return DOBType.BS;
//     default:
//       return DOBType.AD;
//   }
// }

// String dobTypeToJson(DOBType type) {
//   switch (type) {
//     case DOBType.AD:
//       return "AD";
//     case DOBType.BS:
//       return "BS";
//     default:
//       return "AD";
//   }
// }
