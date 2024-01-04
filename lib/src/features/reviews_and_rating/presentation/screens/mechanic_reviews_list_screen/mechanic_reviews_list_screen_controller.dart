import 'package:bato_mechanic/src/features/reviews_and_rating/application/reviews_and_rating_service.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/exceptions/base_exception.dart';

class MechanicReviewsListScreenController
    extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  MechanicReviewsListScreenController({
    required this.ref,
  }) : super(const AsyncData(null));
}

final mechanicReviewsListScreenControllerControllerProvider =
    StateNotifierProvider<MechanicReviewsListScreenController,
        AsyncValue<void>>((ref) {
  return MechanicReviewsListScreenController(ref: ref);
});
