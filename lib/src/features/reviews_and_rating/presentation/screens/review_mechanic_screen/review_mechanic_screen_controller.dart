import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../auth/domain/user.dart';

class ReviewMechanicScreenController extends StateNotifier<AsyncValue<void>> {
  ReviewMechanicScreenController({required this.ref})
      : super(const AsyncData(null));

  final Ref ref;

  Future<bool> reviewMechanic(String mechanicIdx, String repairRequestIdx,
      int stars, String reviewText) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(mechanicServiceProvider)
        .rateAndReviewMechanic(
            mechanicIdx, repairRequestIdx, stars, reviewText));
    return !state.hasError;
  }

  Future<User?> fetchMechanicInfo(String mechanicIdx) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(mechanicServiceProvider).fetchMechanicInfo(mechanicIdx));
    // return state.value!;
    return null;
  }
}

final reviewMechanicScreenControllerProvider =
    StateNotifierProvider<ReviewMechanicScreenController, AsyncValue<void>>(
        (ref) {
  return ReviewMechanicScreenController(ref: ref);
});
