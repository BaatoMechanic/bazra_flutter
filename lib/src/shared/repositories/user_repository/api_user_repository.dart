import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:bato_mechanic/src/shared/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/shared/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user.dart';
import '../../providers/user_settings.dart';
import '../../utils/constants/managers/api_values_manager.dart';
import 'user_repository.dart';
import 'package:http/http.dart' as http;

class APIUserRepository extends UserRepository {
  APIUserRepository({required this.ref});

  final Ref ref;

  @override
  Future<User> fetchUserInfo(String userIdx) async {
    // var url = Uri.parse('${RemoteManager.BASE_URI}autho/user_info/$userIdx');
    var url =
        Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/customers/$userIdx');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);

    return User.fromJson(response);
  }

  @override
  Future<ReviewAndRating> rateAndReviewUser(Map<String, dynamic> body) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/reviews/');
    final response = await HttpHelper.guard(
        () => http.post(url,
            headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            },
            body: body),
        ref);
    return ReviewAndRating.fromJson(response);
  }

  @override
  Future<List<User>> fetchRecommendedMechanics(
      String vehicleCategoryIdx, String serviceIdx) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/user_info/recommended_mechanics/?vehicle_category_speciality=$vehicleCategoryIdx&service_speciality=$serviceIdx');
    var response = await HttpHelper.guard(
        () => http.get(
              url,
              headers: {
                HttpHeaders.authorizationHeader:
                    'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
              },
            ),
        ref);

    return usersFromJson(jsonDecode(response));
  }

  @override
  Future<void> changePassword(String oldPass, String newPass) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/users_management/change_password/');
    await HttpHelper.guard(
        () => http.post(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }, body: {
              "old_password": oldPass,
              "new_password": newPass,
            }),
        ref);
  }

  @override
  Future<bool> updateProfile(Map<String, dynamic> info) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/user_info/me/');
    await HttpHelper.guard(
        () => http.patch(
              url,
              headers: {
                HttpHeaders.authorizationHeader:
                    'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
              },
              body: info,
            ),
        ref);
    // directly return true because if error occurs then it will throw an exception before reaching here
    return true;
  }
}
