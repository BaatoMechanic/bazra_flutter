import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/shared/repositories/mechanic_repository/api_mechanic_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/mechanic.dart';
import 'fake_mechanic_repository.dart';

part 'mechanic_repository.g.dart';

abstract class MechanicRepository {
  Future<List<Mechanic>> fetchRecommendedMechanics(
      String vehicleCategory, String vehiclePartId);

  Future<Mechanic> fetchMechanicInfo(String mechanicId);
  Future<ReviewAndRating> rateAndReviewMechanic(
      String mechanicId, int rating, String review);
}

@riverpod
MechanicRepository mechanicRepository(MechanicRepositoryRef ref) =>
    SHOW_FAKE ? FakeMechanicRepository() : APIMechanicRepository(ref: ref);

@riverpod
Future<Mechanic> fetchMechanicInfo(
    FetchMechanicInfoRef ref, String mechanicId) {
  return ref.watch(mechanicRepositoryProvider).fetchMechanicInfo(mechanicId);
}
