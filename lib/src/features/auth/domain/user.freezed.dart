// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get idx => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_pic")
  String? get profilePic => throw _privateConstructorUsedError;
  @JsonKey(name: "dob_type")
  DOBType get dobType => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: "primary_role")
  String? get primaryRole => throw _privateConstructorUsedError;
  List<String> get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String idx,
      String name,
      String? email,
      String? phone,
      String? gender,
      @JsonKey(name: "profile_pic") String? profilePic,
      @JsonKey(name: "dob_type") DOBType dobType,
      @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
      @JsonKey(name: "primary_role") String? primaryRole,
      List<String> roles});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String name,
      String? email,
      String? phone,
      String? gender,
      @JsonKey(name: "profile_pic") String? profilePic,
      @JsonKey(name: "dob_type") DOBType dobType,
      @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
      @JsonKey(name: "primary_role") String? primaryRole,
      List<String> roles});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
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
  }) {
    return _then(_$UserImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.idx,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender,
      @JsonKey(name: "profile_pic") required this.profilePic,
      @JsonKey(name: "dob_type") required this.dobType,
      @JsonKey(name: "date_of_birth") required this.dateOfBirth,
      @JsonKey(name: "primary_role") required this.primaryRole,
      required final List<String> roles})
      : _roles = roles;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

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
  @JsonKey(name: "profile_pic")
  final String? profilePic;
  @override
  @JsonKey(name: "dob_type")
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
  String toString() {
    return 'User(idx: $idx, name: $name, email: $email, phone: $phone, gender: $gender, profilePic: $profilePic, dobType: $dobType, dateOfBirth: $dateOfBirth, primaryRole: $primaryRole, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
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
            const DeepCollectionEquality().equals(other._roles, _roles));
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
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String idx,
      required final String name,
      required final String? email,
      required final String? phone,
      required final String? gender,
      @JsonKey(name: "profile_pic") required final String? profilePic,
      @JsonKey(name: "dob_type") required final DOBType dobType,
      @JsonKey(name: "date_of_birth") required final DateTime? dateOfBirth,
      @JsonKey(name: "primary_role") required final String? primaryRole,
      required final List<String> roles}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

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
  @JsonKey(name: "profile_pic")
  String? get profilePic;
  @override
  @JsonKey(name: "dob_type")
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
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
