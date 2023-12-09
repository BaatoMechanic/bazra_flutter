import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/model_utils.dart';

import 'user_repository.dart';

class FakeUserRepository extends UserRepository {
  @override
  Future fetchUserInfo(String token) async {
    await Future.delayed(const Duration(seconds: 10));
    return Success(
      code: HttpStatus.ok,
      response: json.encode(
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
}
