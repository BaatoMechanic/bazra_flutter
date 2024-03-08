import 'package:bato_mechanic/src/features/reviews_and_rating/data/reviews_and_rating_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/reviews_and_rating/reviews_and_rating.dart';

part 'reviews_and_rating_service.g.dart';

@riverpod
Future<List<ReviewAndRating>> fetchMechanicReviews(
        FetchMechanicReviewsRef ref, String mechanicIdx) =>
    ref
        .watch(reviewsAndRatingRepositoryProvider)
        .fetchMechanicReviews(mechanicIdx);
