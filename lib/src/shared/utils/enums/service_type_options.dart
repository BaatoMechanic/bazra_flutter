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
