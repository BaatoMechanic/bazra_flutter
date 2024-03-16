import 'dart:io';

import 'package:bato_mechanic/src/features/auth/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/core/data/mechanic_repository/mechanic_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/providers/user_settings_repository.dart';
import '../../../../shared/utils/constants/managers/api_values_manager.dart';
import '../../../../shared/utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class APIMechanicRepository extends MechanicRepository {
  APIMechanicRepository({required this.ref});

  final Ref ref;

  @override
  Future<Mechanic> fetchMechanicInfo(String mechanicId) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/mechanics/$mechanicId');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);

    return Mechanic.fromJson(response);
  }

  @override
  Future<List<Mechanic>> fetchRecommendedMechanics(
      String vehicleCategory, String vehiclePartId) {
    // TODO: implement fetchRecommendedMechanics
    throw UnimplementedError();
  }

  @override
  Future<ReviewAndRating> rateAndReviewMechanic(
      String mechanicId, int rating, String review) {
    // TODO: implement rateAndReviewMechanic
    throw UnimplementedError();
  }
}
