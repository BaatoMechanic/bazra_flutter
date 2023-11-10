import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/mechanic.dart';
import 'fake_mechanic_repository.dart';

abstract class MechanicRepository {
  Future<dynamic> fetchRecommendedMechanics(
      String vehicleCategory, String vehiclePartId);

  Future<dynamic> fetchMechanicInfo(String mechanicId);
  Future<dynamic> rateAndReviewMechanic(
      String mechanicId, int rating, String review);
}

final mechanicRepositoryProvider = Provider((ref) => FakeMechanicRepository());
