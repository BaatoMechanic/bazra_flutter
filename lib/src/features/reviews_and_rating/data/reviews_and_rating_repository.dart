import 'package:bato_mechanic/src/features/reviews_and_rating/data/api_reviews_and_rating_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ReviewsAndRatingRepository {
  Future<dynamic> fetchMechanicReviews(String mechanicIdx);
}

final reviewsAndRatingRepositoryProvider =
    Provider<ReviewsAndRatingRepository>((ref) {
  return ApiReviewsAndRatingRepository(ref);
});

// final reviewsAndRatingRepositoryProvider =
//     Provider<ReviewsAndRatingRepository>((ref) {
//   return FakeReviewsAndRatingRepository();
// });