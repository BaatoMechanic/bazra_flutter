import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/core/data/user_repository/api_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/domain/user.dart';
import '../../../reviews_and_rating/domain/reviews_and_rating.dart';
import 'fake_user_repository.dart';

abstract class UserRepository {
  Future<User> fetchUserInfo(String userIdx);
  Future<ReviewAndRating> rateAndReviewUser(Map<String, dynamic> body);
  Future<List<User>> fetchRecommendedMechanics(
      String vehicleCategoryIdx, String serviceIdx);
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  if (SHOW_FAKE) return FakeUserRepository();
  return APIUserRepository(ref: ref);
});
