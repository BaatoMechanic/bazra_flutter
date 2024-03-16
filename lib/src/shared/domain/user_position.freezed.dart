// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPosition _$UserPositionFromJson(Map<String, dynamic> json) {
  return _UserPosition.fromJson(json);
}

/// @nodoc
mixin _$UserPosition {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  double? get altitude => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;
  @JsonKey(name: "speed_accuracy")
  double? get speedAccuracy => throw _privateConstructorUsedError;
  @JsonKey(name: "location_name")
  String? get locationName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPositionCopyWith<UserPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPositionCopyWith<$Res> {
  factory $UserPositionCopyWith(
          UserPosition value, $Res Function(UserPosition) then) =
      _$UserPositionCopyWithImpl<$Res, UserPosition>;
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      DateTime? timestamp,
      double? accuracy,
      double? altitude,
      double? heading,
      double? speed,
      @JsonKey(name: "speed_accuracy") double? speedAccuracy,
      @JsonKey(name: "location_name") String? locationName});
}

/// @nodoc
class _$UserPositionCopyWithImpl<$Res, $Val extends UserPosition>
    implements $UserPositionCopyWith<$Res> {
  _$UserPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timestamp = freezed,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? speedAccuracy = freezed,
    Object? locationName = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      speedAccuracy: freezed == speedAccuracy
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPositionImplCopyWith<$Res>
    implements $UserPositionCopyWith<$Res> {
  factory _$$UserPositionImplCopyWith(
          _$UserPositionImpl value, $Res Function(_$UserPositionImpl) then) =
      __$$UserPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      DateTime? timestamp,
      double? accuracy,
      double? altitude,
      double? heading,
      double? speed,
      @JsonKey(name: "speed_accuracy") double? speedAccuracy,
      @JsonKey(name: "location_name") String? locationName});
}

/// @nodoc
class __$$UserPositionImplCopyWithImpl<$Res>
    extends _$UserPositionCopyWithImpl<$Res, _$UserPositionImpl>
    implements _$$UserPositionImplCopyWith<$Res> {
  __$$UserPositionImplCopyWithImpl(
      _$UserPositionImpl _value, $Res Function(_$UserPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timestamp = freezed,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
    Object? speedAccuracy = freezed,
    Object? locationName = freezed,
  }) {
    return _then(_$UserPositionImpl(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _value.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: freezed == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      speedAccuracy: freezed == speedAccuracy
          ? _value.speedAccuracy
          : speedAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPositionImpl implements _UserPosition {
  const _$UserPositionImpl(
      {required this.latitude,
      required this.longitude,
      required this.timestamp,
      required this.accuracy,
      required this.altitude,
      required this.heading,
      required this.speed,
      @JsonKey(name: "speed_accuracy") required this.speedAccuracy,
      @JsonKey(name: "location_name") required this.locationName});

  factory _$UserPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPositionImplFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final DateTime? timestamp;
  @override
  final double? accuracy;
  @override
  final double? altitude;
  @override
  final double? heading;
  @override
  final double? speed;
  @override
  @JsonKey(name: "speed_accuracy")
  final double? speedAccuracy;
  @override
  @JsonKey(name: "location_name")
  final String? locationName;

  @override
  String toString() {
    return 'UserPosition(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, speedAccuracy: $speedAccuracy, locationName: $locationName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPositionImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.speedAccuracy, speedAccuracy) ||
                other.speedAccuracy == speedAccuracy) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, timestamp,
      accuracy, altitude, heading, speed, speedAccuracy, locationName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPositionImplCopyWith<_$UserPositionImpl> get copyWith =>
      __$$UserPositionImplCopyWithImpl<_$UserPositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPositionImplToJson(
      this,
    );
  }
}

abstract class _UserPosition implements UserPosition {
  const factory _UserPosition(
      {required final double? latitude,
      required final double? longitude,
      required final DateTime? timestamp,
      required final double? accuracy,
      required final double? altitude,
      required final double? heading,
      required final double? speed,
      @JsonKey(name: "speed_accuracy") required final double? speedAccuracy,
      @JsonKey(name: "location_name")
      required final String? locationName}) = _$UserPositionImpl;

  factory _UserPosition.fromJson(Map<String, dynamic> json) =
      _$UserPositionImpl.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  DateTime? get timestamp;
  @override
  double? get accuracy;
  @override
  double? get altitude;
  @override
  double? get heading;
  @override
  double? get speed;
  @override
  @JsonKey(name: "speed_accuracy")
  double? get speedAccuracy;
  @override
  @JsonKey(name: "location_name")
  String? get locationName;
  @override
  @JsonKey(ignore: true)
  _$$UserPositionImplCopyWith<_$UserPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
