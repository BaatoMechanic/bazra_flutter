import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/auth/domain/user_back.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/api_values_manager.dart';

import '../../../../common/core/repositories/user_settings_repository.dart';
import '../../../auth/domain/user.dart';
import 'user_repository.dart';
import 'package:http/http.dart' as http;

class APIUserRepository extends UserRepository {
  APIUserRepository({required this.ref});

  final Ref ref;

  @override
  Future<User> fetchUserInfo(String userIdx) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/user_info/$userIdx');

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
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/reviews/');
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
}
