// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String get idx => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ServiceTypeOption get type => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "icon_data")
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'parts_included')
  List<String> get partsIncludedIdx => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {String idx,
      String name,
      ServiceTypeOption type,
      String? image,
      @JsonKey(name: "icon_data") String? icon,
      @JsonKey(name: 'parts_included') List<String> partsIncludedIdx});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? type = null,
    Object? image = freezed,
    Object? icon = freezed,
    Object? partsIncludedIdx = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ServiceTypeOption,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      partsIncludedIdx: null == partsIncludedIdx
          ? _value.partsIncludedIdx
          : partsIncludedIdx // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String name,
      ServiceTypeOption type,
      String? image,
      @JsonKey(name: "icon_data") String? icon,
      @JsonKey(name: 'parts_included') List<String> partsIncludedIdx});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? type = null,
    Object? image = freezed,
    Object? icon = freezed,
    Object? partsIncludedIdx = null,
  }) {
    return _then(_$ServiceImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ServiceTypeOption,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      partsIncludedIdx: null == partsIncludedIdx
          ? _value._partsIncludedIdx
          : partsIncludedIdx // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@IconDataConverter()
class _$ServiceImpl implements _Service {
  const _$ServiceImpl(
      {required this.idx,
      required this.name,
      required this.type,
      required this.image,
      @JsonKey(name: "icon_data") required this.icon,
      @JsonKey(name: 'parts_included')
      required final List<String> partsIncludedIdx})
      : _partsIncludedIdx = partsIncludedIdx;

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String idx;
  @override
  final String name;
  @override
  final ServiceTypeOption type;
  @override
  final String? image;
  @override
  @JsonKey(name: "icon_data")
  final String? icon;
  final List<String> _partsIncludedIdx;
  @override
  @JsonKey(name: 'parts_included')
  List<String> get partsIncludedIdx {
    if (_partsIncludedIdx is EqualUnmodifiableListView)
      return _partsIncludedIdx;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partsIncludedIdx);
  }

  @override
  String toString() {
    return 'Service(idx: $idx, name: $name, type: $type, image: $image, icon: $icon, partsIncludedIdx: $partsIncludedIdx)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality()
                .equals(other._partsIncludedIdx, _partsIncludedIdx));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idx, name, type, image, icon,
      const DeepCollectionEquality().hash(_partsIncludedIdx));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {required final String idx,
      required final String name,
      required final ServiceTypeOption type,
      required final String? image,
      @JsonKey(name: "icon_data") required final String? icon,
      @JsonKey(name: 'parts_included')
      required final List<String> partsIncludedIdx}) = _$ServiceImpl;

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String get idx;
  @override
  String get name;
  @override
  ServiceTypeOption get type;
  @override
  String? get image;
  @override
  @JsonKey(name: "icon_data")
  String? get icon;
  @override
  @JsonKey(name: 'parts_included')
  List<String> get partsIncludedIdx;
  @override
  @JsonKey(ignore: true)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
