import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews_and_rating.freezed.dart';
part 'reviews_and_rating.g.dart';

List<ReviewAndRating> reviewsAndRatingsFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => ReviewAndRating.fromJson(json)).toList();
}

@freezed
class ReviewAndRating with _$ReviewAndRating {
  const factory ReviewAndRating({
    required String idx,
    required String review,
    required double rating,
    @JsonKey(name: "reviewer") required String reviewerIdx,
    @JsonKey(name: "reviewed") required String reviewedIdx,
    @JsonKey(name: "repair_request") required String repairRequestIdx,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _ReviewAndRating;

  factory ReviewAndRating.fromJson(Map<String, dynamic> json) =>
      _$ReviewAndRatingFromJson(json);
}
