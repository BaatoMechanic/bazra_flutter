import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/auth/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/core/data/mechanic_repository/api_mechanic_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_mechanic_repository.dart';

abstract class MechanicRepository {
  Future<List<Mechanic>> fetchRecommendedMechanics(
      String vehicleCategory, String vehiclePartId);

  Future<Mechanic> fetchMechanicInfo(String mechanicId);
  Future<ReviewAndRating> rateAndReviewMechanic(
      String mechanicId, int rating, String review);
}

final mechanicRepositoryProvider = Provider((ref) =>
    SHOW_FAKE ? FakeMechanicRepository() : APIMechanicRepository(ref: ref));
