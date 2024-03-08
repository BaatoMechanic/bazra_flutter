// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'osm_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OSMData {
  String get displayname => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OSMDataCopyWith<OSMData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OSMDataCopyWith<$Res> {
  factory $OSMDataCopyWith(OSMData value, $Res Function(OSMData) then) =
      _$OSMDataCopyWithImpl<$Res, OSMData>;
  @useResult
  $Res call({String displayname, double latitude, double longitude});
}

/// @nodoc
class _$OSMDataCopyWithImpl<$Res, $Val extends OSMData>
    implements $OSMDataCopyWith<$Res> {
  _$OSMDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayname = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OSMdataImplCopyWith<$Res> implements $OSMDataCopyWith<$Res> {
  factory _$$OSMdataImplCopyWith(
          _$OSMdataImpl value, $Res Function(_$OSMdataImpl) then) =
      __$$OSMdataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayname, double latitude, double longitude});
}

/// @nodoc
class __$$OSMdataImplCopyWithImpl<$Res>
    extends _$OSMDataCopyWithImpl<$Res, _$OSMdataImpl>
    implements _$$OSMdataImplCopyWith<$Res> {
  __$$OSMdataImplCopyWithImpl(
      _$OSMdataImpl _value, $Res Function(_$OSMdataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayname = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$OSMdataImpl(
      displayname: null == displayname
          ? _value.displayname
          : displayname // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OSMdataImpl implements _OSMdata {
  const _$OSMdataImpl(
      {required this.displayname,
      required this.latitude,
      required this.longitude});

  @override
  final String displayname;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'OSMData(displayname: $displayname, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OSMdataImpl &&
            (identical(other.displayname, displayname) ||
                other.displayname == displayname) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, displayname, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OSMdataImplCopyWith<_$OSMdataImpl> get copyWith =>
      __$$OSMdataImplCopyWithImpl<_$OSMdataImpl>(this, _$identity);
}

abstract class _OSMdata implements OSMData {
  const factory _OSMdata(
      {required final String displayname,
      required final double latitude,
      required final double longitude}) = _$OSMdataImpl;

  @override
  String get displayname;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$OSMdataImplCopyWith<_$OSMdataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
