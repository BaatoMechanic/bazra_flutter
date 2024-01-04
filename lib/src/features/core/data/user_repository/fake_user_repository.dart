import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/auth/domain/user.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';

import 'user_repository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future<User> fetchUserInfo(String token) async {
    await Future.delayed(const Duration(seconds: 10));
    return User.fromJson(
      json.encode(
        {
          "idx": "4ebFHe3UfuBLr9WbEroijH",
          "name": "Mechanic User",
          "email": "user@mechanic.com",
          "phone": null,
          "image": null,
          "primary_role": "Mechanic",
          "roles": [],
          "additional_attributes": {}
        },
      ),
    );
  }

  @override
  Future rateAndReviewUser(Map<String, dynamic> body) {
    // TODO: implement rateUser
    throw UnimplementedError();
  }

  @override
  Future fetchRecommendedMechanics(String vehicleCategory, String vehiclePart) {
    // TODO: implement fetchRecommendedMechanics
    throw UnimplementedError();
  }
}
