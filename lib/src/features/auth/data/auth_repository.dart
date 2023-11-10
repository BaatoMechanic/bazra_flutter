import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_auth_repository.dart';

abstract class AuthRepository {
  Future<dynamic> signInWithIdAndPassword(String uId, String password);
  Future<dynamic> createUserWithIdAndPassword(String uId, String password);
  Future<dynamic> signOut();
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});
