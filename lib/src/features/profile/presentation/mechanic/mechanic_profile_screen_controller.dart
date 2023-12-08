import 'package:bato_mechanic/src/features/profile/application/reviews_and_rating_service.dart';
import 'package:bato_mechanic/src/features/profile/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/features/repair_request/application/mechanic_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/exceptions/base_exception.dart';
import '../../../../utils/model_utils.dart';

class MechanicProfileScreenController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  MechanicProfileScreenController({
    required this.ref,
  }) : super(const AsyncData(null));

  // Future<List<ReviewAndRating>> fetchMechanicReviews(String mechanicIdx) async {
  //   var response = await ref
  //       .read(reviewsAndRatingServiceProvider)
  //       .fetchMechanicReviews(mechanicIdx);

  //   if (response is List<ReviewAndRating>) {
  //     return response;
  //   }

  //   if (response is Failure) {
  //     throw BaseException(message: response.errorResponse.toString());
  //   }

  //   return [];
  // }

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

final mechanicProfileScreenControllerProvider =
    StateNotifierProvider<MechanicProfileScreenController, AsyncValue<void>>(
        (ref) {
  return MechanicProfileScreenController(ref: ref);
});

final fetchMechanicReviewsProvider = FutureProvider.autoDispose
    .family<List<ReviewAndRating>, String>((ref, mechanicIdx) {
  return ref
      .watch(mechanicProfileScreenControllerProvider.notifier)
      .fetchMechanicReviews(mechanicIdx);
});
