import 'package:bato_mechanic/src/features/reviews_and_rating/application/reviews_and_rating_service.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/exceptions/base_exception.dart';

class MechanicReviewsListScreenController
    extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  MechanicReviewsListScreenController({
    required this.ref,
  }) : super(const AsyncData(null));

  Future<List<ReviewAndRating>> fetchMechanicReviews(String mechanicIdx) async {
    // state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(reviewsAndRatingServiceProvider)
        .fetchMechanicReviews(mechanicIdx));
    if (state.hasError) {
      throw BaseException(message: state.error.toString());
    }
    return state.value as List<ReviewAndRating>;
  }
}

final mechanicReviewsListScreenControllerControllerProvider =
    StateNotifierProvider<MechanicReviewsListScreenController,
        AsyncValue<void>>((ref) {
  return MechanicReviewsListScreenController(ref: ref);
});

final fetchMechanicReviewsProvider = FutureProvider.autoDispose
    .family<List<ReviewAndRating>, String>((ref, mechanicIdx) {
  return ref
      .watch(mechanicReviewsListScreenControllerControllerProvider.notifier)
      .fetchMechanicReviews(mechanicIdx);
});
