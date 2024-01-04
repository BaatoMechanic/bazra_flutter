import 'package:bato_mechanic/src/features/core/data/user_repository/api_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_user_repository.dart';

abstract class UserRepository {
  Future<dynamic> fetchUserInfo(String userIdx);
  Future<dynamic> rateAndReviewUser(Map<String, dynamic> body);
  Future<dynamic> fetchRecommendedMechanics(
      String vehicleCategoryIdx, String vehiclePartIdx);
}

// final userRepositoryProvider = Provider<FakeUserRepository>((ref) {
//   return FakeUserRepository();
// });

final userRepositoryProvider = Provider<APIUserRepository>((ref) {
  return APIUserRepository(ref: ref);
});
