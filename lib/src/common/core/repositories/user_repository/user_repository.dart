import 'package:bato_mechanic/src/common/core/repositories/user_repository/api_user_repository.dart';
import 'package:bato_mechanic/src/features/auth/data/api_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_user_repository.dart';

abstract class UserRepository {
  Future fetchUserInfo(String userIdx);
}

final userRepositoryProvider = Provider<FakeUserRepository>((ref) {
  return FakeUserRepository();
});

// final userRepositoryProvider = Provider<APIUserRepository>((ref) {
//   return APIUserRepository(ref: ref);
// });
