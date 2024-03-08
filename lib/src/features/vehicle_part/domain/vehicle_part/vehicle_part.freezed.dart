// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehiclePart _$VehiclePartFromJson(Map<String, dynamic> json) {
  return _VehiclePart.fromJson(json);
}

/// @nodoc
mixin _$VehiclePart {
  String get idx => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_category_idx")
  String get vehicleCategoryIdx => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "is_multiple")
  bool get isMultiple => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehiclePartCopyWith<VehiclePart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehiclePartCopyWith<$Res> {
  factory $VehiclePartCopyWith(
          VehiclePart value, $Res Function(VehiclePart) then) =
      _$VehiclePartCopyWithImpl<$Res, VehiclePart>;
  @useResult
  $Res call(
      {String idx,
      String name,
      @JsonKey(name: "vehicle_category_idx") String vehicleCategoryIdx,
      String? image,
      @JsonKey(name: "is_multiple") bool isMultiple,
      String? position});
}

/// @nodoc
class _$VehiclePartCopyWithImpl<$Res, $Val extends VehiclePart>
    implements $VehiclePartCopyWith<$Res> {
  _$VehiclePartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? vehicleCategoryIdx = null,
    Object? image = freezed,
    Object? isMultiple = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleCategoryIdx: null == vehicleCategoryIdx
          ? _value.vehicleCategoryIdx
          : vehicleCategoryIdx // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isMultiple: null == isMultiple
          ? _value.isMultiple
          : isMultiple // ignore: cast_nullable_to_non_nullable
              as bool,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehiclePartImplCopyWith<$Res>
    implements $VehiclePartCopyWith<$Res> {
  factory _$$VehiclePartImplCopyWith(
          _$VehiclePartImpl value, $Res Function(_$VehiclePartImpl) then) =
      __$$VehiclePartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String name,
      @JsonKey(name: "vehicle_category_idx") String vehicleCategoryIdx,
      String? image,
      @JsonKey(name: "is_multiple") bool isMultiple,
      String? position});
}

/// @nodoc
class __$$VehiclePartImplCopyWithImpl<$Res>
    extends _$VehiclePartCopyWithImpl<$Res, _$VehiclePartImpl>
    implements _$$VehiclePartImplCopyWith<$Res> {
  __$$VehiclePartImplCopyWithImpl(
      _$VehiclePartImpl _value, $Res Function(_$VehiclePartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? vehicleCategoryIdx = null,
    Object? image = freezed,
    Object? isMultiple = null,
    Object? position = freezed,
  }) {
    return _then(_$VehiclePartImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleCategoryIdx: null == vehicleCategoryIdx
          ? _value.vehicleCategoryIdx
          : vehicleCategoryIdx // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isMultiple: null == isMultiple
          ? _value.isMultiple
          : isMultiple // ignore: cast_nullable_to_non_nullable
              as bool,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehiclePartImpl implements _VehiclePart {
  const _$VehiclePartImpl(
      {required this.idx,
      required this.name,
      @JsonKey(name: "vehicle_category_idx") required this.vehicleCategoryIdx,
      this.image,
      @JsonKey(name: "is_multiple") required this.isMultiple,
      this.position});

  factory _$VehiclePartImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehiclePartImplFromJson(json);

  @override
  final String idx;
  @override
  final String name;
  @override
  @JsonKey(name: "vehicle_category_idx")
  final String vehicleCategoryIdx;
  @override
  final String? image;
  @override
  @JsonKey(name: "is_multiple")
  final bool isMultiple;
  @override
  final String? position;

  @override
  String toString() {
    return 'VehiclePart(idx: $idx, name: $name, vehicleCategoryIdx: $vehicleCategoryIdx, image: $image, isMultiple: $isMultiple, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiclePartImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vehicleCategoryIdx, vehicleCategoryIdx) ||
                other.vehicleCategoryIdx == vehicleCategoryIdx) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isMultiple, isMultiple) ||
                other.isMultiple == isMultiple) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idx, name, vehicleCategoryIdx, image, isMultiple, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehiclePartImplCopyWith<_$VehiclePartImpl> get copyWith =>
      __$$VehiclePartImplCopyWithImpl<_$VehiclePartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehiclePartImplToJson(
      this,
    );
  }
}

abstract class _VehiclePart implements VehiclePart {
  const factory _VehiclePart(
      {required final String idx,
      required final String name,
      @JsonKey(name: "vehicle_category_idx")
      required final String vehicleCategoryIdx,
      final String? image,
      @JsonKey(name: "is_multiple") required final bool isMultiple,
      final String? position}) = _$VehiclePartImpl;

  factory _VehiclePart.fromJson(Map<String, dynamic> json) =
      _$VehiclePartImpl.fromJson;

  @override
  String get idx;
  @override
  String get name;
  @override
  @JsonKey(name: "vehicle_category_idx")
  String get vehicleCategoryIdx;
  @override
  String? get image;
  @override
  @JsonKey(name: "is_multiple")
  bool get isMultiple;
  @override
  String? get position;
  @override
  @JsonKey(ignore: true)
  _$$VehiclePartImplCopyWith<_$VehiclePartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
