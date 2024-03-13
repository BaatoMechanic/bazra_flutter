// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_repair_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleRepairRequest _$VehicleRepairRequestFromJson(Map<String, dynamic> json) {
  return _VehicleRepairRequest.fromJson(json);
}

/// @nodoc
mixin _$VehicleRepairRequest {
  String get idx => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "user")
  String get userIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle_type")
  String get vehicleCategoryIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "service_type")
  String get serviceTypeIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "preferred_mechanic")
  String? get preferredMechanicIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "assigned_mechanic")
  String? get assignedMechanicIdx => throw _privateConstructorUsedError;
  Map<String, dynamic>? get location => throw _privateConstructorUsedError;
  VehicleRepairRequestStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: "advance_payment_status")
  AdvancePaymentStatus get advancePaymentStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "advance_charge")
  double? get advanceCharge => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleRepairRequestCopyWith<VehicleRepairRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRepairRequestCopyWith<$Res> {
  factory $VehicleRepairRequestCopyWith(VehicleRepairRequest value,
          $Res Function(VehicleRepairRequest) then) =
      _$VehicleRepairRequestCopyWithImpl<$Res, VehicleRepairRequest>;
  @useResult
  $Res call(
      {String idx,
      String? title,
      String? description,
      @JsonKey(name: "user") String userIdx,
      @JsonKey(name: "vehicle_type") String vehicleCategoryIdx,
      @JsonKey(name: "service_type") String serviceTypeIdx,
      @JsonKey(name: "preferred_mechanic") String? preferredMechanicIdx,
      @JsonKey(name: "assigned_mechanic") String? assignedMechanicIdx,
      Map<String, dynamic>? location,
      VehicleRepairRequestStatus status,
      @JsonKey(name: "advance_payment_status")
      AdvancePaymentStatus advancePaymentStatus,
      @JsonKey(name: "advance_charge") double? advanceCharge,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$VehicleRepairRequestCopyWithImpl<$Res,
        $Val extends VehicleRepairRequest>
    implements $VehicleRepairRequestCopyWith<$Res> {
  _$VehicleRepairRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? userIdx = null,
    Object? vehicleCategoryIdx = null,
    Object? serviceTypeIdx = null,
    Object? preferredMechanicIdx = freezed,
    Object? assignedMechanicIdx = freezed,
    Object? location = freezed,
    Object? status = null,
    Object? advancePaymentStatus = null,
    Object? advanceCharge = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdx: null == userIdx
          ? _value.userIdx
          : userIdx // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleCategoryIdx: null == vehicleCategoryIdx
          ? _value.vehicleCategoryIdx
          : vehicleCategoryIdx // ignore: cast_nullable_to_non_nullable
              as String,
      serviceTypeIdx: null == serviceTypeIdx
          ? _value.serviceTypeIdx
          : serviceTypeIdx // ignore: cast_nullable_to_non_nullable
              as String,
      preferredMechanicIdx: freezed == preferredMechanicIdx
          ? _value.preferredMechanicIdx
          : preferredMechanicIdx // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedMechanicIdx: freezed == assignedMechanicIdx
          ? _value.assignedMechanicIdx
          : assignedMechanicIdx // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VehicleRepairRequestStatus,
      advancePaymentStatus: null == advancePaymentStatus
          ? _value.advancePaymentStatus
          : advancePaymentStatus // ignore: cast_nullable_to_non_nullable
              as AdvancePaymentStatus,
      advanceCharge: freezed == advanceCharge
          ? _value.advanceCharge
          : advanceCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleRepairRequestImplCopyWith<$Res>
    implements $VehicleRepairRequestCopyWith<$Res> {
  factory _$$VehicleRepairRequestImplCopyWith(_$VehicleRepairRequestImpl value,
          $Res Function(_$VehicleRepairRequestImpl) then) =
      __$$VehicleRepairRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String? title,
      String? description,
      @JsonKey(name: "user") String userIdx,
      @JsonKey(name: "vehicle_type") String vehicleCategoryIdx,
      @JsonKey(name: "service_type") String serviceTypeIdx,
      @JsonKey(name: "preferred_mechanic") String? preferredMechanicIdx,
      @JsonKey(name: "assigned_mechanic") String? assignedMechanicIdx,
      Map<String, dynamic>? location,
      VehicleRepairRequestStatus status,
      @JsonKey(name: "advance_payment_status")
      AdvancePaymentStatus advancePaymentStatus,
      @JsonKey(name: "advance_charge") double? advanceCharge,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$VehicleRepairRequestImplCopyWithImpl<$Res>
    extends _$VehicleRepairRequestCopyWithImpl<$Res, _$VehicleRepairRequestImpl>
    implements _$$VehicleRepairRequestImplCopyWith<$Res> {
  __$$VehicleRepairRequestImplCopyWithImpl(_$VehicleRepairRequestImpl _value,
      $Res Function(_$VehicleRepairRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? userIdx = null,
    Object? vehicleCategoryIdx = null,
    Object? serviceTypeIdx = null,
    Object? preferredMechanicIdx = freezed,
    Object? assignedMechanicIdx = freezed,
    Object? location = freezed,
    Object? status = null,
    Object? advancePaymentStatus = null,
    Object? advanceCharge = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$VehicleRepairRequestImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdx: null == userIdx
          ? _value.userIdx
          : userIdx // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleCategoryIdx: null == vehicleCategoryIdx
          ? _value.vehicleCategoryIdx
          : vehicleCategoryIdx // ignore: cast_nullable_to_non_nullable
              as String,
      serviceTypeIdx: null == serviceTypeIdx
          ? _value.serviceTypeIdx
          : serviceTypeIdx // ignore: cast_nullable_to_non_nullable
              as String,
      preferredMechanicIdx: freezed == preferredMechanicIdx
          ? _value.preferredMechanicIdx
          : preferredMechanicIdx // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedMechanicIdx: freezed == assignedMechanicIdx
          ? _value.assignedMechanicIdx
          : assignedMechanicIdx // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VehicleRepairRequestStatus,
      advancePaymentStatus: null == advancePaymentStatus
          ? _value.advancePaymentStatus
          : advancePaymentStatus // ignore: cast_nullable_to_non_nullable
              as AdvancePaymentStatus,
      advanceCharge: freezed == advanceCharge
          ? _value.advanceCharge
          : advanceCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleRepairRequestImpl implements _VehicleRepairRequest {
  const _$VehicleRepairRequestImpl(
      {required this.idx,
      required this.title,
      required this.description,
      @JsonKey(name: "user") required this.userIdx,
      @JsonKey(name: "vehicle_type") required this.vehicleCategoryIdx,
      @JsonKey(name: "service_type") required this.serviceTypeIdx,
      @JsonKey(name: "preferred_mechanic") required this.preferredMechanicIdx,
      @JsonKey(name: "assigned_mechanic") required this.assignedMechanicIdx,
      required final Map<String, dynamic>? location,
      required this.status,
      @JsonKey(name: "advance_payment_status")
      required this.advancePaymentStatus,
      @JsonKey(name: "advance_charge") required this.advanceCharge,
      @JsonKey(name: "created_at") required this.createdAt})
      : _location = location;

  factory _$VehicleRepairRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleRepairRequestImplFromJson(json);

  @override
  final String idx;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "user")
  final String userIdx;
  @override
  @JsonKey(name: "vehicle_type")
  final String vehicleCategoryIdx;
  @override
  @JsonKey(name: "service_type")
  final String serviceTypeIdx;
  @override
  @JsonKey(name: "preferred_mechanic")
  final String? preferredMechanicIdx;
  @override
  @JsonKey(name: "assigned_mechanic")
  final String? assignedMechanicIdx;
  final Map<String, dynamic>? _location;
  @override
  Map<String, dynamic>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableMapView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final VehicleRepairRequestStatus status;
  @override
  @JsonKey(name: "advance_payment_status")
  final AdvancePaymentStatus advancePaymentStatus;
  @override
  @JsonKey(name: "advance_charge")
  final double? advanceCharge;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'VehicleRepairRequest(idx: $idx, title: $title, description: $description, userIdx: $userIdx, vehicleCategoryIdx: $vehicleCategoryIdx, serviceTypeIdx: $serviceTypeIdx, preferredMechanicIdx: $preferredMechanicIdx, assignedMechanicIdx: $assignedMechanicIdx, location: $location, status: $status, advancePaymentStatus: $advancePaymentStatus, advanceCharge: $advanceCharge, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleRepairRequestImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userIdx, userIdx) || other.userIdx == userIdx) &&
            (identical(other.vehicleCategoryIdx, vehicleCategoryIdx) ||
                other.vehicleCategoryIdx == vehicleCategoryIdx) &&
            (identical(other.serviceTypeIdx, serviceTypeIdx) ||
                other.serviceTypeIdx == serviceTypeIdx) &&
            (identical(other.preferredMechanicIdx, preferredMechanicIdx) ||
                other.preferredMechanicIdx == preferredMechanicIdx) &&
            (identical(other.assignedMechanicIdx, assignedMechanicIdx) ||
                other.assignedMechanicIdx == assignedMechanicIdx) &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.advancePaymentStatus, advancePaymentStatus) ||
                other.advancePaymentStatus == advancePaymentStatus) &&
            (identical(other.advanceCharge, advanceCharge) ||
                other.advanceCharge == advanceCharge) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idx,
      title,
      description,
      userIdx,
      vehicleCategoryIdx,
      serviceTypeIdx,
      preferredMechanicIdx,
      assignedMechanicIdx,
      const DeepCollectionEquality().hash(_location),
      status,
      advancePaymentStatus,
      advanceCharge,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleRepairRequestImplCopyWith<_$VehicleRepairRequestImpl>
      get copyWith =>
          __$$VehicleRepairRequestImplCopyWithImpl<_$VehicleRepairRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleRepairRequestImplToJson(
      this,
    );
  }
}

abstract class _VehicleRepairRequest implements VehicleRepairRequest {
  const factory _VehicleRepairRequest(
      {required final String idx,
      required final String? title,
      required final String? description,
      @JsonKey(name: "user") required final String userIdx,
      @JsonKey(name: "vehicle_type") required final String vehicleCategoryIdx,
      @JsonKey(name: "service_type") required final String serviceTypeIdx,
      @JsonKey(name: "preferred_mechanic")
      required final String? preferredMechanicIdx,
      @JsonKey(name: "assigned_mechanic")
      required final String? assignedMechanicIdx,
      required final Map<String, dynamic>? location,
      required final VehicleRepairRequestStatus status,
      @JsonKey(name: "advance_payment_status")
      required final AdvancePaymentStatus advancePaymentStatus,
      @JsonKey(name: "advance_charge") required final double? advanceCharge,
      @JsonKey(name: "created_at")
      required final DateTime createdAt}) = _$VehicleRepairRequestImpl;

  factory _VehicleRepairRequest.fromJson(Map<String, dynamic> json) =
      _$VehicleRepairRequestImpl.fromJson;

  @override
  String get idx;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "user")
  String get userIdx;
  @override
  @JsonKey(name: "vehicle_type")
  String get vehicleCategoryIdx;
  @override
  @JsonKey(name: "service_type")
  String get serviceTypeIdx;
  @override
  @JsonKey(name: "preferred_mechanic")
  String? get preferredMechanicIdx;
  @override
  @JsonKey(name: "assigned_mechanic")
  String? get assignedMechanicIdx;
  @override
  Map<String, dynamic>? get location;
  @override
  VehicleRepairRequestStatus get status;
  @override
  @JsonKey(name: "advance_payment_status")
  AdvancePaymentStatus get advancePaymentStatus;
  @override
  @JsonKey(name: "advance_charge")
  double? get advanceCharge;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$VehicleRepairRequestImplCopyWith<_$VehicleRepairRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleRepairRequestImage _$VehicleRepairRequestImageFromJson(
    Map<String, dynamic> json) {
  return _VehicleRepairRequestImage.fromJson(json);
}

/// @nodoc
mixin _$VehicleRepairRequestImage {
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleRepairRequestImageCopyWith<VehicleRepairRequestImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRepairRequestImageCopyWith<$Res> {
  factory $VehicleRepairRequestImageCopyWith(VehicleRepairRequestImage value,
          $Res Function(VehicleRepairRequestImage) then) =
      _$VehicleRepairRequestImageCopyWithImpl<$Res, VehicleRepairRequestImage>;
  @useResult
  $Res call({int id, String image});
}

/// @nodoc
class _$VehicleRepairRequestImageCopyWithImpl<$Res,
        $Val extends VehicleRepairRequestImage>
    implements $VehicleRepairRequestImageCopyWith<$Res> {
  _$VehicleRepairRequestImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleRepairRequestImageImplCopyWith<$Res>
    implements $VehicleRepairRequestImageCopyWith<$Res> {
  factory _$$VehicleRepairRequestImageImplCopyWith(
          _$VehicleRepairRequestImageImpl value,
          $Res Function(_$VehicleRepairRequestImageImpl) then) =
      __$$VehicleRepairRequestImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String image});
}

/// @nodoc
class __$$VehicleRepairRequestImageImplCopyWithImpl<$Res>
    extends _$VehicleRepairRequestImageCopyWithImpl<$Res,
        _$VehicleRepairRequestImageImpl>
    implements _$$VehicleRepairRequestImageImplCopyWith<$Res> {
  __$$VehicleRepairRequestImageImplCopyWithImpl(
      _$VehicleRepairRequestImageImpl _value,
      $Res Function(_$VehicleRepairRequestImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_$VehicleRepairRequestImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleRepairRequestImageImpl implements _VehicleRepairRequestImage {
  const _$VehicleRepairRequestImageImpl(
      {required this.id, required this.image});

  factory _$VehicleRepairRequestImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleRepairRequestImageImplFromJson(json);

  @override
  final int id;
  @override
  final String image;

  @override
  String toString() {
    return 'VehicleRepairRequestImage(id: $id, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleRepairRequestImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleRepairRequestImageImplCopyWith<_$VehicleRepairRequestImageImpl>
      get copyWith => __$$VehicleRepairRequestImageImplCopyWithImpl<
          _$VehicleRepairRequestImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleRepairRequestImageImplToJson(
      this,
    );
  }
}

abstract class _VehicleRepairRequestImage implements VehicleRepairRequestImage {
  const factory _VehicleRepairRequestImage(
      {required final int id,
      required final String image}) = _$VehicleRepairRequestImageImpl;

  factory _VehicleRepairRequestImage.fromJson(Map<String, dynamic> json) =
      _$VehicleRepairRequestImageImpl.fromJson;

  @override
  int get id;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$VehicleRepairRequestImageImplCopyWith<_$VehicleRepairRequestImageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VehicleRepairRequestVideo _$VehicleRepairRequestVideoFromJson(
    Map<String, dynamic> json) {
  return _VehicleRepairRequestVideo.fromJson(json);
}

/// @nodoc
mixin _$VehicleRepairRequestVideo {
  int get id => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleRepairRequestVideoCopyWith<VehicleRepairRequestVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRepairRequestVideoCopyWith<$Res> {
  factory $VehicleRepairRequestVideoCopyWith(VehicleRepairRequestVideo value,
          $Res Function(VehicleRepairRequestVideo) then) =
      _$VehicleRepairRequestVideoCopyWithImpl<$Res, VehicleRepairRequestVideo>;
  @useResult
  $Res call({int id, String video});
}

/// @nodoc
class _$VehicleRepairRequestVideoCopyWithImpl<$Res,
        $Val extends VehicleRepairRequestVideo>
    implements $VehicleRepairRequestVideoCopyWith<$Res> {
  _$VehicleRepairRequestVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? video = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleRepairRequestVideoImplCopyWith<$Res>
    implements $VehicleRepairRequestVideoCopyWith<$Res> {
  factory _$$VehicleRepairRequestVideoImplCopyWith(
          _$VehicleRepairRequestVideoImpl value,
          $Res Function(_$VehicleRepairRequestVideoImpl) then) =
      __$$VehicleRepairRequestVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String video});
}

/// @nodoc
class __$$VehicleRepairRequestVideoImplCopyWithImpl<$Res>
    extends _$VehicleRepairRequestVideoCopyWithImpl<$Res,
        _$VehicleRepairRequestVideoImpl>
    implements _$$VehicleRepairRequestVideoImplCopyWith<$Res> {
  __$$VehicleRepairRequestVideoImplCopyWithImpl(
      _$VehicleRepairRequestVideoImpl _value,
      $Res Function(_$VehicleRepairRequestVideoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? video = null,
  }) {
    return _then(_$VehicleRepairRequestVideoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleRepairRequestVideoImpl implements _VehicleRepairRequestVideo {
  const _$VehicleRepairRequestVideoImpl(
      {required this.id, required this.video});

  factory _$VehicleRepairRequestVideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleRepairRequestVideoImplFromJson(json);

  @override
  final int id;
  @override
  final String video;

  @override
  String toString() {
    return 'VehicleRepairRequestVideo(id: $id, video: $video)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleRepairRequestVideoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, video);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleRepairRequestVideoImplCopyWith<_$VehicleRepairRequestVideoImpl>
      get copyWith => __$$VehicleRepairRequestVideoImplCopyWithImpl<
          _$VehicleRepairRequestVideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleRepairRequestVideoImplToJson(
      this,
    );
  }
}

abstract class _VehicleRepairRequestVideo implements VehicleRepairRequestVideo {
  const factory _VehicleRepairRequestVideo(
      {required final int id,
      required final String video}) = _$VehicleRepairRequestVideoImpl;

  factory _VehicleRepairRequestVideo.fromJson(Map<String, dynamic> json) =
      _$VehicleRepairRequestVideoImpl.fromJson;

  @override
  int get id;
  @override
  String get video;
  @override
  @JsonKey(ignore: true)
  _$$VehicleRepairRequestVideoImplCopyWith<_$VehicleRepairRequestVideoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
