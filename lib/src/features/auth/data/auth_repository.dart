import 'package:bato_mechanic/src/features/auth/data/api_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_auth_repository.dart';

abstract class AuthRepository {
  Future<dynamic> signInWithIdAndPassword(String uId, String password);
  Future<dynamic> refreshToken(String refreshToken);
  Future<dynamic> createUserWithIdAndPassword(String uId, String password);
  Future getUserInfo(String token);
  void signOut(Ref ref);
}

// final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
//   return FakeAuthRepository();
// });

final authRepositoryProvider = Provider<APIAuthRepository>((ref) {
  return APIAuthRepository();
});
