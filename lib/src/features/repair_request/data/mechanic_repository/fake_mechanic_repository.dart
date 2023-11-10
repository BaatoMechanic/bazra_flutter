import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/constants/test_categories.dart';
import 'package:bato_mechanic/src/constants/test_mechanics.dart';
import 'package:bato_mechanic/src/constants/test_vehicles.dart';
import 'package:bato_mechanic/src/features/repair_request/data/vehicle_category_repository/vehicle_category_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/mechanic_repository/mechanic_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_category.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:http/http.dart';

class FakeMechanicRepository implements MechanicRepository {
  @override
  Future<dynamic> fetchRecommendedMechanics(
      String vehicleCategoryId, String vehiclePartId) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Mechanic> mechanics = mTestMechanics
        .where((mechanic) =>
            mechanic.vehicleCategorySpeciality == vehicleCategoryId &&
            mechanic.vehiclePartSpeciality == vehiclePartId)
        .toList();
    return Success(code: HttpStatus.ok, response: mechanics);
    // return Failure(
    //     code: HttpStatus.badRequest,
    //     errorResponse: "Couldn't fetch mechanics",
    //     stackTrace: StackTrace.current);
  }

  @override
  fetchMechanicInfo(String mechanicId) async {
    var responseBody = {
      "id": 1,
      "user_id": 2,
      "name": "Krishna Rimal",
      "phone_number": "9808144809",
      "username": "mechanicUser",
      "email": "mail@mechanic.com",
      "description": "I am a mechanic",
      "image": "http://localhost:8000/media/store/images/mechanic/mechanic.png",
      "vehicle_speciality": "bike",
      "vehicle_part_speciality": "wheel",
      "current_location": {
        "accuracy": 99,
        "longitude": 85.33825904130937,
        "latitude": 27.707645262018172,
        // "timestamp": DateTime.now(),
        "timestamp": "2023-01-05 12:00:00",
        "location_name": "Kohalpur",
        "altitude": 0,
        "heading": 0,
        "speed": 0,
        "speed_accuracy": 0,
      },
      "average_rating": 0,
    };
    await Future.delayed(const Duration(seconds: 1));
    return Success(code: HttpStatus.ok, response: jsonEncode(responseBody));
  }

  @override
  Future rateAndReviewMechanic(
      String mechanicId, int rating, String review) async {
    await Future.delayed(Duration(seconds: 1));
    return Success(code: HttpStatus.created, response: {
      "id": 1,
      "mechanic_id": 1,
      "rating": 2.4,
      "review": "This is a test review"
    });
  }
}
