import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_position.freezed.dart';
part 'user_position.g.dart';

@freezed
class UserPosition with _$UserPosition {
  const factory UserPosition({
    required double? latitude,
    required double? longitude,
    required DateTime? timestamp,
    required double? accuracy,
    required double? altitude,
    required double? heading,
    required double? speed,
    @JsonKey(name: "speed_accuracy") required double? speedAccuracy,
    @JsonKey(name: "location_name") required String? locationName,
  }) = _UserPosition;

  factory UserPosition.fromJson(Map<String, dynamic> json) =>
      _$UserPositionFromJson(json);
}
