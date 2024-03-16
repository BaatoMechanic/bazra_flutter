// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mechanic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mechanic _$MechanicFromJson(Map<String, dynamic> json) {
  return _Mechanic.fromJson(json);
}

/// @nodoc
mixin _$Mechanic {
  String get idx => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get profilePic => throw _privateConstructorUsedError;
  @JsonKey(name: 'dob_type')
  DOBType get dobType => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_role")
  String? get primaryRole => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_speciality")
  String get vehicleSpecialityIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "service_speciality")
  String get serviceSpecialityIdx => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "additional_attributes")
  Map<String, dynamic> get additionalAttributes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MechanicCopyWith<Mechanic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MechanicCopyWith<$Res> {
  factory $MechanicCopyWith(Mechanic value, $Res Function(Mechanic) then) =
      _$MechanicCopyWithImpl<$Res, Mechanic>;
  @useResult
  $Res call(
      {String idx,
      String name,
      String? email,
      String? phone,
      String? gender,
      @JsonKey(name: 'image') String? profilePic,
      @JsonKey(name: 'dob_type') DOBType dobType,
      @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
      @JsonKey(name: "primary_role") String? primaryRole,
      List<String> roles,
      @JsonKey(name: "vehicle_speciality") String vehicleSpecialityIdx,
      @JsonKey(name: "service_speciality") String serviceSpecialityIdx,
      String? description,
      @JsonKey(name: "additional_attributes")
      Map<String, dynamic> additionalAttributes});
}

/// @nodoc
class _$MechanicCopyWithImpl<$Res, $Val extends Mechanic>
    implements $MechanicCopyWith<$Res> {
  _$MechanicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? profilePic = freezed,
    Object? dobType = null,
    Object? dateOfBirth = freezed,
    Object? primaryRole = freezed,
    Object? roles = null,
    Object? vehicleSpecialityIdx = null,
    Object? serviceSpecialityIdx = null,
    Object? description = freezed,
    Object? additionalAttributes = null,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      dobType: null == dobType
          ? _value.dobType
          : dobType // ignore: cast_nullable_to_non_nullable
              as DOBType,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      primaryRole: freezed == primaryRole
          ? _value.primaryRole
          : primaryRole // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleSpecialityIdx: null == vehicleSpecialityIdx
          ? _value.vehicleSpecialityIdx
          : vehicleSpecialityIdx // ignore: cast_nullable_to_non_nullable
              as String,
      serviceSpecialityIdx: null == serviceSpecialityIdx
          ? _value.serviceSpecialityIdx
          : serviceSpecialityIdx // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalAttributes: null == additionalAttributes
          ? _value.additionalAttributes
          : additionalAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MechanicImplCopyWith<$Res>
    implements $MechanicCopyWith<$Res> {
  factory _$$MechanicImplCopyWith(
          _$MechanicImpl value, $Res Function(_$MechanicImpl) then) =
      __$$MechanicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String name,
      String? email,
      String? phone,
      String? gender,
      @JsonKey(name: 'image') String? profilePic,
      @JsonKey(name: 'dob_type') DOBType dobType,
      @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
      @JsonKey(name: "primary_role") String? primaryRole,
      List<String> roles,
      @JsonKey(name: "vehicle_speciality") String vehicleSpecialityIdx,
      @JsonKey(name: "service_speciality") String serviceSpecialityIdx,
      String? description,
      @JsonKey(name: "additional_attributes")
      Map<String, dynamic> additionalAttributes});
}

/// @nodoc
class __$$MechanicImplCopyWithImpl<$Res>
    extends _$MechanicCopyWithImpl<$Res, _$MechanicImpl>
    implements _$$MechanicImplCopyWith<$Res> {
  __$$MechanicImplCopyWithImpl(
      _$MechanicImpl _value, $Res Function(_$MechanicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? name = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? profilePic = freezed,
    Object? dobType = null,
    Object? dateOfBirth = freezed,
    Object? primaryRole = freezed,
    Object? roles = null,
    Object? vehicleSpecialityIdx = null,
    Object? serviceSpecialityIdx = null,
    Object? description = freezed,
    Object? additionalAttributes = null,
  }) {
    return _then(_$MechanicImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      dobType: null == dobType
          ? _value.dobType
          : dobType // ignore: cast_nullable_to_non_nullable
              as DOBType,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      primaryRole: freezed == primaryRole
          ? _value.primaryRole
          : primaryRole // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vehicleSpecialityIdx: null == vehicleSpecialityIdx
          ? _value.vehicleSpecialityIdx
          : vehicleSpecialityIdx // ignore: cast_nullable_to_non_nullable
              as String,
      serviceSpecialityIdx: null == serviceSpecialityIdx
          ? _value.serviceSpecialityIdx
          : serviceSpecialityIdx // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalAttributes: null == additionalAttributes
          ? _value._additionalAttributes
          : additionalAttributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MechanicImpl implements _Mechanic {
  const _$MechanicImpl(
      {required this.idx,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      @JsonKey(name: 'image') required this.profilePic,
      @JsonKey(name: 'dob_type') required this.dobType,
      @JsonKey(name: "date_of_birth") required this.dateOfBirth,
      @JsonKey(name: "primary_role") required this.primaryRole,
      required final List<String> roles,
      @JsonKey(name: "vehicle_speciality") required this.vehicleSpecialityIdx,
      @JsonKey(name: "service_speciality") required this.serviceSpecialityIdx,
      required this.description,
      @JsonKey(name: "additional_attributes")
      required final Map<String, dynamic> additionalAttributes})
      : _roles = roles,
        _additionalAttributes = additionalAttributes;

  factory _$MechanicImpl.fromJson(Map<String, dynamic> json) =>
      _$$MechanicImplFromJson(json);

  @override
  final String idx;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'image')
  final String? profilePic;
  @override
  @JsonKey(name: 'dob_type')
  final DOBType dobType;
  @override
  @JsonKey(name: "date_of_birth")
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: "primary_role")
  final String? primaryRole;
  final List<String> _roles;
  @override
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  @JsonKey(name: "vehicle_speciality")
  final String vehicleSpecialityIdx;
  @override
  @JsonKey(name: "service_speciality")
  final String serviceSpecialityIdx;
  @override
  final String? description;
  final Map<String, dynamic> _additionalAttributes;
  @override
  @JsonKey(name: "additional_attributes")
  Map<String, dynamic> get additionalAttributes {
    if (_additionalAttributes is EqualUnmodifiableMapView)
      return _additionalAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalAttributes);
  }

  @override
  String toString() {
    return 'Mechanic(idx: $idx, name: $name, email: $email, phone: $phone, gender: $gender, profilePic: $profilePic, dobType: $dobType, dateOfBirth: $dateOfBirth, primaryRole: $primaryRole, roles: $roles, vehicleSpecialityIdx: $vehicleSpecialityIdx, serviceSpecialityIdx: $serviceSpecialityIdx, description: $description, additionalAttributes: $additionalAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MechanicImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.dobType, dobType) || other.dobType == dobType) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.primaryRole, primaryRole) ||
                other.primaryRole == primaryRole) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.vehicleSpecialityIdx, vehicleSpecialityIdx) ||
                other.vehicleSpecialityIdx == vehicleSpecialityIdx) &&
            (identical(other.serviceSpecialityIdx, serviceSpecialityIdx) ||
                other.serviceSpecialityIdx == serviceSpecialityIdx) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._additionalAttributes, _additionalAttributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idx,
      name,
      email,
      phone,
      gender,
      profilePic,
      dobType,
      dateOfBirth,
      primaryRole,
      const DeepCollectionEquality().hash(_roles),
      vehicleSpecialityIdx,
      serviceSpecialityIdx,
      description,
      const DeepCollectionEquality().hash(_additionalAttributes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MechanicImplCopyWith<_$MechanicImpl> get copyWith =>
      __$$MechanicImplCopyWithImpl<_$MechanicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MechanicImplToJson(
      this,
    );
  }
}

abstract class _Mechanic implements Mechanic {
  const factory _Mechanic(
          {required final String idx,
          required final String name,
          required final String? email,
          required final String? phone,
          required final String? gender,
          @JsonKey(name: 'image') required final String? profilePic,
          @JsonKey(name: 'dob_type') required final DOBType dobType,
          @JsonKey(name: "date_of_birth") required final DateTime? dateOfBirth,
          @JsonKey(name: "primary_role") required final String? primaryRole,
          required final List<String> roles,
          @JsonKey(name: "vehicle_speciality")
          required final String vehicleSpecialityIdx,
          @JsonKey(name: "service_speciality")
          required final String serviceSpecialityIdx,
          required final String? description,
          @JsonKey(name: "additional_attributes")
          required final Map<String, dynamic> additionalAttributes}) =
      _$MechanicImpl;

  factory _Mechanic.fromJson(Map<String, dynamic> json) =
      _$MechanicImpl.fromJson;

  @override
  String get idx;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'image')
  String? get profilePic;
  @override
  @JsonKey(name: 'dob_type')
  DOBType get dobType;
  @override
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: "primary_role")
  String? get primaryRole;
  @override
  List<String> get roles;
  @override
  @JsonKey(name: "vehicle_speciality")
  String get vehicleSpecialityIdx;
  @override
  @JsonKey(name: "service_speciality")
  String get serviceSpecialityIdx;
  @override
  String? get description;
  @override
  @JsonKey(name: "additional_attributes")
  Map<String, dynamic> get additionalAttributes;
  @override
  @JsonKey(ignore: true)
  _$$MechanicImplCopyWith<_$MechanicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
