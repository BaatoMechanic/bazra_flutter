// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_step_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepairStepReport _$RepairStepReportFromJson(Map<String, dynamic> json) {
  return _RepairStepReport.fromJson(json);
}

/// @nodoc
mixin _$RepairStepReport {
  String get idx => throw _privateConstructorUsedError;
  List<Map<String, String>> get billImages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairStepReportCopyWith<RepairStepReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairStepReportCopyWith<$Res> {
  factory $RepairStepReportCopyWith(
          RepairStepReport value, $Res Function(RepairStepReport) then) =
      _$RepairStepReportCopyWithImpl<$Res, RepairStepReport>;
  @useResult
  $Res call({String idx, List<Map<String, String>> billImages});
}

/// @nodoc
class _$RepairStepReportCopyWithImpl<$Res, $Val extends RepairStepReport>
    implements $RepairStepReportCopyWith<$Res> {
  _$RepairStepReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? billImages = null,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      billImages: null == billImages
          ? _value.billImages
          : billImages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairStepReportImplCopyWith<$Res>
    implements $RepairStepReportCopyWith<$Res> {
  factory _$$RepairStepReportImplCopyWith(_$RepairStepReportImpl value,
          $Res Function(_$RepairStepReportImpl) then) =
      __$$RepairStepReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idx, List<Map<String, String>> billImages});
}

/// @nodoc
class __$$RepairStepReportImplCopyWithImpl<$Res>
    extends _$RepairStepReportCopyWithImpl<$Res, _$RepairStepReportImpl>
    implements _$$RepairStepReportImplCopyWith<$Res> {
  __$$RepairStepReportImplCopyWithImpl(_$RepairStepReportImpl _value,
      $Res Function(_$RepairStepReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? billImages = null,
  }) {
    return _then(_$RepairStepReportImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      billImages: null == billImages
          ? _value._billImages
          : billImages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairStepReportImpl implements _RepairStepReport {
  const _$RepairStepReportImpl(
      {required this.idx, required final List<Map<String, String>> billImages})
      : _billImages = billImages;

  factory _$RepairStepReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairStepReportImplFromJson(json);

  @override
  final String idx;
  final List<Map<String, String>> _billImages;
  @override
  List<Map<String, String>> get billImages {
    if (_billImages is EqualUnmodifiableListView) return _billImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billImages);
  }

  @override
  String toString() {
    return 'RepairStepReport(idx: $idx, billImages: $billImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairStepReportImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            const DeepCollectionEquality()
                .equals(other._billImages, _billImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idx, const DeepCollectionEquality().hash(_billImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairStepReportImplCopyWith<_$RepairStepReportImpl> get copyWith =>
      __$$RepairStepReportImplCopyWithImpl<_$RepairStepReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairStepReportImplToJson(
      this,
    );
  }
}

abstract class _RepairStepReport implements RepairStepReport {
  const factory _RepairStepReport(
          {required final String idx,
          required final List<Map<String, String>> billImages}) =
      _$RepairStepReportImpl;

  factory _RepairStepReport.fromJson(Map<String, dynamic> json) =
      _$RepairStepReportImpl.fromJson;

  @override
  String get idx;
  @override
  List<Map<String, String>> get billImages;
  @override
  @JsonKey(ignore: true)
  _$$RepairStepReportImplCopyWith<_$RepairStepReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
