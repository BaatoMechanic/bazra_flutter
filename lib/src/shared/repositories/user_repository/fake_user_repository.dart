import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';

import '../../domain/user.dart';
import 'user_repository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future<User> fetchUserInfo(String userIdx) async {
    await Future.delayed(const Duration(seconds: 1));
    return User.fromJson(
      {
        "idx": "4ebFHe3UfuBLr9WbEroijH",
        "name": "Mechanic User",
        "email": "user@mechanic.com",
        "phone": null,
        "image": null,
        "primary_role": "Mechanic",
        "roles": [],
        "additional_attributes": {
          "vehicle_part": "Engine",
          "vehicle_category": "Car",
        }
      },
    );
  }

  @override
  Future<ReviewAndRating> rateAndReviewUser(Map<String, dynamic> body) async {
    return await Future.delayed(
        const Duration(seconds: 1),
        () => ReviewAndRating.fromJson({
              "idx": "SdgYDwWpqizXHoHZSmsxio",
              "rating": 1.5,
              "review":
                  "I got very good service from this same user previous time. But this time, he was a trash mechanic",
              "reviewer": "itLGCnD7vf9P7eucZf3Kgo",
              "reviewed": "4ebFHe3UfuBLr9WbEroijH",
              "repair_request": "WQCRQRZcrcmHD2bKf9WTcV",
              "created_at": "2023-12-16T17:25:48.761636Z"
            }));
  }

  @override
  Future<List<User>> fetchRecommendedMechanics(
      String vehicleCategoryIdx, String serviceIdx) async {
    await Future.delayed(const Duration(seconds: 1));
    return usersFromJson(
      [
        {
          "idx": "4ebFHe3UfuBLr9WbEroijH",
          "name": "Mechanic User",
          "email": "user@mechanic.com",
          "phone": null,
          "image": null,
          "primary_role": "Mechanic",
          "roles": [],
          "additional_attributes": {
            "vehicle_part": "Engine",
            "vehicle_category": "Car",
          }
        },
        {
          "idx": "4ebFHe3UfuBLr9WbEroijH",
          "name": "Mechanic User",
          "email": "user@mechanic.com",
          "phone": null,
          "image": null,
          "primary_role": "Mechanic",
          "roles": [],
          "additional_attributes": {
            "vehicle_part": "Engine",
            "vehicle_category": "Car",
          }
        },
      ],
    );
  }

  @override
  Future<void> changePassword(String oldPass, String newPass) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<bool> updateProfile(Map<String, dynamic> info) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<User> fetchUserInfoByUidx(String uIdx) {
    // TODO: implement fetchUserInfoByUidx
    throw UnimplementedError();
  }
}
