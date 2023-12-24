// import 'dart:convert';
// import 'dart:io';

// import 'package:bato_mechanic/src/features/auth/domain/user.dart';
// import 'package:bato_mechanic/src/utils/constants/test_mechanics.dart';
// import 'package:bato_mechanic/src/features/core/data/mechanic_repository/mechanic_repository.dart';

// import 'package:bato_mechanic/src/utils/model_utils.dart';

// class FakeMechanicRepository implements MechanicRepository {
//   @override
//   Future<dynamic> fetchRecommendedMechanics(
//       String vehicleCategoryId, String vehiclePartId) async {
//     await Future.delayed(const Duration(seconds: 1));
//     List<User> mechanics = mTestMechanics
//         .where((User mechanic) =>
//             mechanic.additionalAttributes["vehicleCategorySpeciality"] ==
//                 vehicleCategoryId &&
//             mechanic.additionalAttributes["vehiclePartSpeciality"] ==
//                 vehiclePartId)
//         .toList();
//     return Success(code: HttpStatus.ok, response: mechanics);
//     // return Failure(
//     //     code: HttpStatus.badRequest,
//     //     errorResponse: "Couldn't fetch mechanics",
//     //     stackTrace: StackTrace.current);
//   }

//   @override
//   fetchMechanicInfo(String mechanicId) async {
//     // var responseBody = {
//     //   "id": 1,
//     //   "user_id": 2,
//     //   "name": "Krishna Rimal",
//     //   "phone_number": "9808144809",
//     //   "username": "mechanicUser",
//     //   "email": "mail@mechanic.com",
//     //   "description": "I am a mechanic",
//     //   "image": "http://localhost:8000/media/store/images/mechanic/mechanic.png",
//     //   "vehicle_speciality": "bike",
//     //   "vehicle_part_speciality": "wheel",
//     //   "current_location": {
//     //     "accuracy": 99,
//     //     "longitude": 85.33825904130937,
//     //     "latitude": 27.707645262018172,
//     //     // "timestamp": DateTime.now(),
//     //     "timestamp": "2023-01-05 12:00:00",
//     //     "location_name": "Kohalpur",
//     //     "altitude": 0,
//     //     "heading": 0,
//     //     "speed": 0,
//     //     "speed_accuracy": 0,
//     //   },
//     //   "average_rating": 0,
//     // };

//     var responseBody = {
//       "idx": "4ebFHe3UfuBLr9WbEroijH",
//       "name": "Mechanic User",
//       "email": "user@mechanic.com",
//       "phone": null,
//       "image": null,
//       "primary_role": "Mechanic",
//       "roles": [],
//       "additional_attributes": {
//         "vehicle_category_speciality": "bike",
//         "vehicle_part_speciality": "wheel"
//       },
//       "current_location": {
//         "accuracy": 99.9,
//         "longitude": 85.33825904130937,
//         "latitude": 27.707645262018172,
//         "timestamp": "2023-01-05 12:00:00",
//         "altitude": 0.0,
//         "heading": 0.0,
//         "speed": 0.0,
//         "speed_accuracy": 0.0,
//         "location_name": "KTM",
//       },
//     };

//     await Future.delayed(const Duration(seconds: 1));
//     return Success(code: HttpStatus.ok, response: jsonEncode(responseBody));
//   }

//   @override
//   Future rateAndReviewMechanic(
//       String mechanicId, int rating, String review) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return Success(code: HttpStatus.created, response: {
//       "id": 1,
//       "mechanic_id": 1,
//       "rating": 2.4,
//       "review": "This is a test review"
//     });
//   }
// }
