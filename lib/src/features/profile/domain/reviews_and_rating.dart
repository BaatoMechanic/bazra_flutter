// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<ReviewAndRating> reviewsAndRatingsFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => ReviewAndRating.fromMap(json)).toList();
}

class ReviewAndRating {
  final String idx;
  final String review;
  final double rating;
  final String reviewerIdx;
  final String reviewedIdx;
  final DateTime createdAt;
  ReviewAndRating({
    required this.idx,
    required this.review,
    required this.rating,
    required this.reviewerIdx,
    required this.reviewedIdx,
    required this.createdAt,
  });

  ReviewAndRating copyWith({
    String? idx,
    String? review,
    double? rating,
    String? reviewerIdx,
    String? reviewedIdx,
    DateTime? createdAt,
  }) {
    return ReviewAndRating(
      idx: idx ?? this.idx,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      reviewerIdx: reviewerIdx ?? this.reviewerIdx,
      reviewedIdx: reviewedIdx ?? this.reviewedIdx,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idx': idx,
      'review': review,
      'rating': rating,
      'reviewer': reviewerIdx,
      'reviewed': reviewedIdx,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ReviewAndRating.fromMap(Map<String, dynamic> map) {
    return ReviewAndRating(
      idx: map['idx'] as String,
      review: map['review'] as String,
      rating: map['rating'] as double,
      reviewerIdx: map['reviewer'] as String,
      reviewedIdx: map['reviewed'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewAndRating.fromJson(String source) =>
      ReviewAndRating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewAndRating(idx: $idx, review: $review, rating: $rating, reviewerIdx: $reviewerIdx, reviewedIdx: $reviewedIdx, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ReviewAndRating other) {
    if (identical(this, other)) return true;

    return other.idx == idx &&
        other.review == review &&
        other.rating == rating &&
        other.reviewerIdx == reviewerIdx &&
        other.reviewedIdx == reviewedIdx &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return idx.hashCode ^
        review.hashCode ^
        rating.hashCode ^
        reviewerIdx.hashCode ^
        reviewedIdx.hashCode ^
        createdAt.hashCode;
  }
}
