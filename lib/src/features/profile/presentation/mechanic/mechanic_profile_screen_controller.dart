import 'package:bato_mechanic/src/features/reviews_and_rating/application/reviews_and_rating_service.dart';
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
}

final mechanicProfileScreenControllerProvider =
    StateNotifierProvider<MechanicProfileScreenController, AsyncValue<void>>(
        (ref) {
  return MechanicProfileScreenController(ref: ref);
});
