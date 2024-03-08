import 'package:bato_mechanic/src/features/reviews_and_rating/data/api_reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/data/fake_reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../main.dart';

part 'reviews_and_rating_repository.g.dart';

abstract class ReviewsAndRatingRepository {
  Future<List<ReviewAndRating>> fetchMechanicReviews(String mechanicIdx);
}

@riverpod
ReviewsAndRatingRepository reviewsAndRatingRepository(
        ReviewsAndRatingRepositoryRef ref) =>
    SHOW_FAKE
        ? FakeReviewsAndRatingRepository()
        : ApiReviewsAndRatingRepository(ref);
