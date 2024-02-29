import 'package:bato_mechanic/src/features/reviews_and_rating/data/api_reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/data/fake_reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';

abstract class ReviewsAndRatingRepository {
  Future<List<ReviewAndRating>> fetchMechanicReviews(String mechanicIdx);
}

final reviewsAndRatingRepositoryProvider =
    Provider<ReviewsAndRatingRepository>((ref) {
  if (SHOW_FAKE) return FakeReviewsAndRatingRepository();
  return ApiReviewsAndRatingRepository(ref);
  // return FakeReviewsAndRatingRepository();
});
