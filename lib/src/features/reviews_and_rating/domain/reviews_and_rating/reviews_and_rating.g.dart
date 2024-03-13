// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_and_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewAndRatingImpl _$$ReviewAndRatingImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewAndRatingImpl(
      idx: json['idx'] as String,
      review: json['review'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewerIdx: json['reviewer'] as String,
      reviewedIdx: json['reviewed'] as String,
      repairRequestIdx: json['repair_request'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReviewAndRatingImplToJson(
        _$ReviewAndRatingImpl instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'review': instance.review,
      'rating': instance.rating,
      'reviewer': instance.reviewerIdx,
      'reviewed': instance.reviewedIdx,
      'repair_request': instance.repairRequestIdx,
      'created_at': instance.createdAt.toIso8601String(),
    };
