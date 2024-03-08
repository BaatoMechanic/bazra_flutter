// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_and_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewAndRating _$ReviewAndRatingFromJson(Map<String, dynamic> json) {
  return _ReviewAndRating.fromJson(json);
}

/// @nodoc
mixin _$ReviewAndRating {
  String get idx => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewer_idx")
  String get reviewerIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewed_idx")
  String get reviewedIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "repair_request_idx")
  String get repairRequestIdx => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewAndRatingCopyWith<ReviewAndRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewAndRatingCopyWith<$Res> {
  factory $ReviewAndRatingCopyWith(
          ReviewAndRating value, $Res Function(ReviewAndRating) then) =
      _$ReviewAndRatingCopyWithImpl<$Res, ReviewAndRating>;
  @useResult
  $Res call(
      {String idx,
      String review,
      double rating,
      @JsonKey(name: "reviewer_idx") String reviewerIdx,
      @JsonKey(name: "reviewed_idx") String reviewedIdx,
      @JsonKey(name: "repair_request_idx") String repairRequestIdx,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$ReviewAndRatingCopyWithImpl<$Res, $Val extends ReviewAndRating>
    implements $ReviewAndRatingCopyWith<$Res> {
  _$ReviewAndRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? review = null,
    Object? rating = null,
    Object? reviewerIdx = null,
    Object? reviewedIdx = null,
    Object? repairRequestIdx = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewerIdx: null == reviewerIdx
          ? _value.reviewerIdx
          : reviewerIdx // ignore: cast_nullable_to_non_nullable
              as String,
      reviewedIdx: null == reviewedIdx
          ? _value.reviewedIdx
          : reviewedIdx // ignore: cast_nullable_to_non_nullable
              as String,
      repairRequestIdx: null == repairRequestIdx
          ? _value.repairRequestIdx
          : repairRequestIdx // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewAndRatingImplCopyWith<$Res>
    implements $ReviewAndRatingCopyWith<$Res> {
  factory _$$ReviewAndRatingImplCopyWith(_$ReviewAndRatingImpl value,
          $Res Function(_$ReviewAndRatingImpl) then) =
      __$$ReviewAndRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idx,
      String review,
      double rating,
      @JsonKey(name: "reviewer_idx") String reviewerIdx,
      @JsonKey(name: "reviewed_idx") String reviewedIdx,
      @JsonKey(name: "repair_request_idx") String repairRequestIdx,
      @JsonKey(name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$ReviewAndRatingImplCopyWithImpl<$Res>
    extends _$ReviewAndRatingCopyWithImpl<$Res, _$ReviewAndRatingImpl>
    implements _$$ReviewAndRatingImplCopyWith<$Res> {
  __$$ReviewAndRatingImplCopyWithImpl(
      _$ReviewAndRatingImpl _value, $Res Function(_$ReviewAndRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idx = null,
    Object? review = null,
    Object? rating = null,
    Object? reviewerIdx = null,
    Object? reviewedIdx = null,
    Object? repairRequestIdx = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReviewAndRatingImpl(
      idx: null == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewerIdx: null == reviewerIdx
          ? _value.reviewerIdx
          : reviewerIdx // ignore: cast_nullable_to_non_nullable
              as String,
      reviewedIdx: null == reviewedIdx
          ? _value.reviewedIdx
          : reviewedIdx // ignore: cast_nullable_to_non_nullable
              as String,
      repairRequestIdx: null == repairRequestIdx
          ? _value.repairRequestIdx
          : repairRequestIdx // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewAndRatingImpl implements _ReviewAndRating {
  const _$ReviewAndRatingImpl(
      {required this.idx,
      required this.review,
      required this.rating,
      @JsonKey(name: "reviewer_idx") required this.reviewerIdx,
      @JsonKey(name: "reviewed_idx") required this.reviewedIdx,
      @JsonKey(name: "repair_request_idx") required this.repairRequestIdx,
      @JsonKey(name: "created_at") required this.createdAt});

  factory _$ReviewAndRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewAndRatingImplFromJson(json);

  @override
  final String idx;
  @override
  final String review;
  @override
  final double rating;
  @override
  @JsonKey(name: "reviewer_idx")
  final String reviewerIdx;
  @override
  @JsonKey(name: "reviewed_idx")
  final String reviewedIdx;
  @override
  @JsonKey(name: "repair_request_idx")
  final String repairRequestIdx;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'ReviewAndRating(idx: $idx, review: $review, rating: $rating, reviewerIdx: $reviewerIdx, reviewedIdx: $reviewedIdx, repairRequestIdx: $repairRequestIdx, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewAndRatingImpl &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewerIdx, reviewerIdx) ||
                other.reviewerIdx == reviewerIdx) &&
            (identical(other.reviewedIdx, reviewedIdx) ||
                other.reviewedIdx == reviewedIdx) &&
            (identical(other.repairRequestIdx, repairRequestIdx) ||
                other.repairRequestIdx == repairRequestIdx) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idx, review, rating, reviewerIdx,
      reviewedIdx, repairRequestIdx, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewAndRatingImplCopyWith<_$ReviewAndRatingImpl> get copyWith =>
      __$$ReviewAndRatingImplCopyWithImpl<_$ReviewAndRatingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewAndRatingImplToJson(
      this,
    );
  }
}

abstract class _ReviewAndRating implements ReviewAndRating {
  const factory _ReviewAndRating(
          {required final String idx,
          required final String review,
          required final double rating,
          @JsonKey(name: "reviewer_idx") required final String reviewerIdx,
          @JsonKey(name: "reviewed_idx") required final String reviewedIdx,
          @JsonKey(name: "repair_request_idx")
          required final String repairRequestIdx,
          @JsonKey(name: "created_at") required final DateTime createdAt}) =
      _$ReviewAndRatingImpl;

  factory _ReviewAndRating.fromJson(Map<String, dynamic> json) =
      _$ReviewAndRatingImpl.fromJson;

  @override
  String get idx;
  @override
  String get review;
  @override
  double get rating;
  @override
  @JsonKey(name: "reviewer_idx")
  String get reviewerIdx;
  @override
  @JsonKey(name: "reviewed_idx")
  String get reviewedIdx;
  @override
  @JsonKey(name: "repair_request_idx")
  String get repairRequestIdx;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReviewAndRatingImplCopyWith<_$ReviewAndRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
