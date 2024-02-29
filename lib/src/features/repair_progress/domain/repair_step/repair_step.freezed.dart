// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepairStep _$RepairStepFromJson(Map<String, dynamic> json) {
  return _RepairStep.fromJson(json);
}

/// @nodoc
mixin _$RepairStep {
  String get idx => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get textDescription => throw _privateConstructorUsedError;
  @FileConverter()
  File? get audioDescription => throw _privateConstructorUsedError;
  RepairStepStatus get status => throw _privateConstructorUsedError;
  RepairStepReport? get report => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairStepCopyWith<RepairStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairStepCopyWith<$Res> {
  factory $RepairStepCopyWith(
          RepairStep value, $Res Function(RepairStep) then) =
      _$RepairStepCopyWithImpl<$Res, RepairStep>;
  @useResult
  $Res call(
      {String idx,
      String name,
      String? textDescription,
      @FileConverter() File? audioDescription,
      RepairStepStatus status,
      RepairStepReport? report});

  $RepairStepReportCopyWith<$Res>? get report;
}

/// @nodoc
class _$RepairStepCopyWithImpl<$Res, $Val extends RepairStep>
    implements $RepairStepCopyWith<$Res> {
  _$RepairStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? textDescription = freezed,
    Object? audioDescription = freezed,
    Object? status = null,
    Object? report = freezed,
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
      textDescription: freezed == textDescription
          ? _value.textDescription
          : textDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      audioDescription: freezed == audioDescription
          ? _value.audioDescription
          : audioDescription // ignore: cast_nullable_to_non_nullable
              as File?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RepairStepStatus,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as RepairStepReport?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RepairStepReportCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $RepairStepReportCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepairStepImplCopyWith<$Res>
    implements $RepairStepCopyWith<$Res> {
  factory _$$RepairStepImplCopyWith(
          _$RepairStepImpl value, $Res Function(_$RepairStepImpl) then) =
      __$$RepairStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String name,
      String? textDescription,
      @FileConverter() File? audioDescription,
      RepairStepStatus status,
      RepairStepReport? report});

  @override
  $RepairStepReportCopyWith<$Res>? get report;
}

/// @nodoc
class __$$RepairStepImplCopyWithImpl<$Res>
    extends _$RepairStepCopyWithImpl<$Res, _$RepairStepImpl>
    implements _$$RepairStepImplCopyWith<$Res> {
  __$$RepairStepImplCopyWithImpl(
      _$RepairStepImpl _value, $Res Function(_$RepairStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? textDescription = freezed,
    Object? audioDescription = freezed,
    Object? status = null,
    Object? report = freezed,
  }) {
    return _then(_$RepairStepImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      textDescription: freezed == textDescription
          ? _value.textDescription
          : textDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      audioDescription: freezed == audioDescription
          ? _value.audioDescription
          : audioDescription // ignore: cast_nullable_to_non_nullable
              as File?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RepairStepStatus,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as RepairStepReport?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairStepImpl implements _RepairStep {
  const _$RepairStepImpl(
      {required this.idx,
      required this.name,
      required this.textDescription,
      @FileConverter() required this.audioDescription,
      required this.status,
      required this.report});

  factory _$RepairStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairStepImplFromJson(json);

  @override
  final String idx;
  @override
  final String name;
  @override
  final String? textDescription;
  @override
  @FileConverter()
  final File? audioDescription;
  @override
  final RepairStepStatus status;
  @override
  final RepairStepReport? report;

  @override
  String toString() {
    return 'RepairStep(idx: $idx, name: $name, textDescription: $textDescription, audioDescription: $audioDescription, status: $status, report: $report)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairStepImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.textDescription, textDescription) ||
                other.textDescription == textDescription) &&
            (identical(other.audioDescription, audioDescription) ||
                other.audioDescription == audioDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.report, report) || other.report == report));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idx, name, textDescription,
      audioDescription, status, report);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairStepImplCopyWith<_$RepairStepImpl> get copyWith =>
      __$$RepairStepImplCopyWithImpl<_$RepairStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairStepImplToJson(
      this,
    );
  }
}

abstract class _RepairStep implements RepairStep {
  const factory _RepairStep(
      {required final String idx,
      required final String name,
      required final String? textDescription,
      @FileConverter() required final File? audioDescription,
      required final RepairStepStatus status,
      required final RepairStepReport? report}) = _$RepairStepImpl;

  factory _RepairStep.fromJson(Map<String, dynamic> json) =
      _$RepairStepImpl.fromJson;

  @override
  String get idx;
  @override
  String get name;
  @override
  String? get textDescription;
  @override
  @FileConverter()
  File? get audioDescription;
  @override
  RepairStepStatus get status;
  @override
  RepairStepReport? get report;
  @override
  @JsonKey(ignore: true)
  _$$RepairStepImplCopyWith<_$RepairStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
