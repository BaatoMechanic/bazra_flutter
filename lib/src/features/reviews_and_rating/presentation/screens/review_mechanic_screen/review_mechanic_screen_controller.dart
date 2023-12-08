import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewMechanicScreenController extends StateNotifier<AsyncValue<void>> {
  ReviewMechanicScreenController({required this.ref}) : super(AsyncData(null));

  final Ref ref;
}

final reviewMechanicScreenControllerProvider =
    StateNotifierProvider<ReviewMechanicScreenController, AsyncValue<void>>(
        (ref) {
  return ReviewMechanicScreenController(ref: ref);
});
