import 'dart:convert';

import 'package:bato_mechanic/src/features/reviews_and_rating/data/reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/reviews_and_rating.dart';

class ReviewsAndRatingService {
  ReviewsAndRatingService({
    required this.ref,
  });
  final Ref ref;
}

final reviewsAndRatingServiceProvider = Provider((ref) {
  return ReviewsAndRatingService(ref: ref);
});

final fetchMechanicReviewsProvider = FutureProvider.family
    .autoDispose<List<ReviewAndRating>, String>((ref, mechanicIdx) async {
  return await ref
      .watch(reviewsAndRatingRepositoryProvider)
      .fetchMechanicReviews(mechanicIdx);
});
