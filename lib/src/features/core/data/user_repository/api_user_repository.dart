import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/api_values_manager.dart';

import '../../../../common/core/repositories/user_settings_repository.dart';
import 'user_repository.dart';
import 'package:http/http.dart' as http;

class APIUserRepository extends UserRepository {
  APIUserRepository({required this.ref});

  final Ref ref;

  @override
  Future<dynamic> fetchUserInfo(String userIdx) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/user_info/$userIdx');

    return await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
  }

  @override
  Future<dynamic> rateAndReviewUser(Map<String, dynamic> body) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/reviews/');
    await HttpHelper.guard(
        () => http.post(url,
            headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            },
            body: body),
        ref);
  }

  @override
  Future fetchRecommendedMechanics(
      String vehicleCategoryIdx, String vehiclePartIdx) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}autho/user_info/recommended_mechanics/');
    Map<String, dynamic> body = {
      "vehicle_category": vehicleCategoryIdx,
      "vehicle_part": vehiclePartIdx,
    };
    await HttpHelper.guard(
        () => http.post(
              url,
              headers: {
                HttpHeaders.authorizationHeader:
                    'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
              },
              body: body,
            ),
        ref);
  }
}
