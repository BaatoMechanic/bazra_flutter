// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mechanic_tip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MechanicTip _$MechanicTipFromJson(Map<String, dynamic> json) {
  return _MechanicTip.fromJson(json);
}

/// @nodoc
mixin _$MechanicTip {
  String get idx => throw _privateConstructorUsedError;
  String get tip => throw _privateConstructorUsedError;
  Map<String, dynamic> get mechanic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MechanicTipCopyWith<MechanicTip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MechanicTipCopyWith<$Res> {
  factory $MechanicTipCopyWith(
          MechanicTip value, $Res Function(MechanicTip) then) =
      _$MechanicTipCopyWithImpl<$Res, MechanicTip>;
  @useResult
  $Res call({String idx, String tip, Map<String, dynamic> mechanic});
}

/// @nodoc
class _$MechanicTipCopyWithImpl<$Res, $Val extends MechanicTip>
    implements $MechanicTipCopyWith<$Res> {
  _$MechanicTipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? tip = null,
    Object? mechanic = null,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String,
      mechanic: null == mechanic
          ? _value.mechanic
          : mechanic // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MechanicTipImplCopyWith<$Res>
    implements $MechanicTipCopyWith<$Res> {
  factory _$$MechanicTipImplCopyWith(
          _$MechanicTipImpl value, $Res Function(_$MechanicTipImpl) then) =
      __$$MechanicTipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idx, String tip, Map<String, dynamic> mechanic});
}

/// @nodoc
class __$$MechanicTipImplCopyWithImpl<$Res>
    extends _$MechanicTipCopyWithImpl<$Res, _$MechanicTipImpl>
    implements _$$MechanicTipImplCopyWith<$Res> {
  __$$MechanicTipImplCopyWithImpl(
      _$MechanicTipImpl _value, $Res Function(_$MechanicTipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? tip = null,
    Object? mechanic = null,
  }) {
    return _then(_$MechanicTipImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      tip: null == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String,
      mechanic: null == mechanic
          ? _value._mechanic
          : mechanic // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanicTipImpl implements _MechanicTip {
  const _$MechanicTipImpl(
      {required this.idx,
      required this.tip,
      required final Map<String, dynamic> mechanic})
      : _mechanic = mechanic;

  factory _$MechanicTipImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanicTipImplFromJson(json);

  @override
  final String idx;
  @override
  final String tip;
  final Map<String, dynamic> _mechanic;
  @override
  Map<String, dynamic> get mechanic {
    if (_mechanic is EqualUnmodifiableMapView) return _mechanic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mechanic);
  }

  @override
  String toString() {
    return 'MechanicTip(idx: $idx, tip: $tip, mechanic: $mechanic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanicTipImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.tip, tip) || other.tip == tip) &&
            const DeepCollectionEquality().equals(other._mechanic, _mechanic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idx, tip, const DeepCollectionEquality().hash(_mechanic));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanicTipImplCopyWith<_$MechanicTipImpl> get copyWith =>
      __$$MechanicTipImplCopyWithImpl<_$MechanicTipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanicTipImplToJson(
      this,
    );
  }
}

abstract class _MechanicTip implements MechanicTip {
  const factory _MechanicTip(
      {required final String idx,
      required final String tip,
      required final Map<String, dynamic> mechanic}) = _$MechanicTipImpl;

  factory _MechanicTip.fromJson(Map<String, dynamic> json) =
      _$MechanicTipImpl.fromJson;

  @override
  String get idx;
  @override
  String get tip;
  @override
  Map<String, dynamic> get mechanic;
  @override
  @JsonKey(ignore: true)
  _$$MechanicTipImplCopyWith<_$MechanicTipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
