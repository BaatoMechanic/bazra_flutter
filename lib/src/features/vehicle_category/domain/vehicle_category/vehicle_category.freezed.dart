// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleCategory _$VehicleCategoryFromJson(Map<String, dynamic> json) {
  return _VehicleCategory.fromJson(json);
}

/// @nodoc
mixin _$VehicleCategory {
  String get idx => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCategoryCopyWith<VehicleCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCategoryCopyWith<$Res> {
  factory $VehicleCategoryCopyWith(
          VehicleCategory value, $Res Function(VehicleCategory) then) =
      _$VehicleCategoryCopyWithImpl<$Res, VehicleCategory>;
  @useResult
  $Res call({String idx, String name, String image});
}

/// @nodoc
class _$VehicleCategoryCopyWithImpl<$Res, $Val extends VehicleCategory>
    implements $VehicleCategoryCopyWith<$Res> {
  _$VehicleCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? image = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleCategoryImplCopyWith<$Res>
    implements $VehicleCategoryCopyWith<$Res> {
  factory _$$VehicleCategoryImplCopyWith(_$VehicleCategoryImpl value,
          $Res Function(_$VehicleCategoryImpl) then) =
      __$$VehicleCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idx, String name, String image});
}

/// @nodoc
class __$$VehicleCategoryImplCopyWithImpl<$Res>
    extends _$VehicleCategoryCopyWithImpl<$Res, _$VehicleCategoryImpl>
    implements _$$VehicleCategoryImplCopyWith<$Res> {
  __$$VehicleCategoryImplCopyWithImpl(
      _$VehicleCategoryImpl _value, $Res Function(_$VehicleCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$VehicleCategoryImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleCategoryImpl implements _VehicleCategory {
  const _$VehicleCategoryImpl(
      {required this.idx, required this.name, required this.image});

  factory _$VehicleCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleCategoryImplFromJson(json);

  @override
  final String idx;
  @override
  final String name;
  @override
  final String image;

  @override
  String toString() {
    return 'VehicleCategory(idx: $idx, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleCategoryImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idx, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleCategoryImplCopyWith<_$VehicleCategoryImpl> get copyWith =>
      __$$VehicleCategoryImplCopyWithImpl<_$VehicleCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleCategoryImplToJson(
      this,
    );
  }
}

abstract class _VehicleCategory implements VehicleCategory {
  const factory _VehicleCategory(
      {required final String idx,
      required final String name,
      required final String image}) = _$VehicleCategoryImpl;

  factory _VehicleCategory.fromJson(Map<String, dynamic> json) =
      _$VehicleCategoryImpl.fromJson;

  @override
  String get idx;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$VehicleCategoryImplCopyWith<_$VehicleCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
