import 'package:bato_mechanic/src/features/auth/data/api_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_auth_repository.dart';

abstract class AuthRepository {
  Future<dynamic> signInWithIdAndPassword(String uId, String password);
  Future<dynamic> createUserWithIdAndPassword(String uId, String password);
  Future getUserInfo(String token);
  Future<dynamic> signOut();
}

// final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
//   return FakeAuthRepository();
// });
final authRepositoryProvider = Provider<APIAuthRepository>((ref) {
  return APIAuthRepository();
});
