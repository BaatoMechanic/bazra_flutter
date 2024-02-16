import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/auth/data/remote/api_remote_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user.dart';
import '../../domain/user_back.dart';
import 'fake_remote_auth_repository.dart';

abstract class RemoteAuthRepository {
  Future<Map<String, dynamic>> signInWithIdAndPassword(
      String uId, String password);
  Future<Map<String, dynamic>> refreshToken(String refreshToken);
  Future<User> createUserWithIdAndPassword(String uId, String password);
  Future<User> getCurrentUserInfo(String token);
  Future<void> signOut(Ref ref);
}

final authRepositoryProvider = Provider<RemoteAuthRepository>((ref) {
  if (SHOW_FAKE) {
    return FakeRemoteAuthRepository();
  } else {
    return APIRemoteAuthRepository(ref: ref);
  }
  // return ref.watch(fakeAuthRepositoryProvider);
});
