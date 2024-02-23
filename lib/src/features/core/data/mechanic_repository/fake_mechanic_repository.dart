import 'dart:convert';

import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/utils/constants/test_mechanics.dart';
import 'package:bato_mechanic/src/features/core/data/mechanic_repository/mechanic_repository.dart';


import '../../../auth/domain/mechanic.dart';

class FakeMechanicRepository implements MechanicRepository {
  @override
  Future<List<Mechanic>> fetchRecommendedMechanics(
      String vehicleCategoryId, String vehiclePartId) async {
    await Future.delayed(const Duration(seconds: 1));

    return mTestMechanics;
  }

  @override
  Future<Mechanic> fetchMechanicInfo(String mechanicId) async {
    var responseBody = {
      "idx": "4ebFHe3UfuBLr9WbEroijH",
      "name": "Mechanic User",
      "email": "user@mechanic.com",
      "phone": null,
      "image": null,
      "primary_role": "Mechanic",
      "roles": [],
      "additional_attributes": {
        "vehicle_category_speciality": "bike",
        "vehicle_part_speciality": "wheel"
      },
      "current_location": {
        "accuracy": 99.9,
        "longitude": 85.33825904130937,
        "latitude": 27.707645262018172,
        "timestamp": "2023-01-05 12:00:00",
        "altitude": 0.0,
        "heading": 0.0,
        "speed": 0.0,
        "speed_accuracy": 0.0,
        "location_name": "KTM",
      },
    };

    await Future.delayed(const Duration(seconds: 1));
    return Mechanic.fromJson(responseBody);
  }

  @override
  Future<ReviewAndRating> rateAndReviewMechanic(
      String mechanicId, int rating, String review) async {
    await Future.delayed(const Duration(seconds: 1));
    return ReviewAndRating.fromJson(jsonEncode({
      "id": 1,
      "mechanic_id": 1,
      "rating": 2.4,
      "review": "This is a test review"
    }));
  }
}
