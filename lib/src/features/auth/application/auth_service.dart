// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/remote/remote_auth_repository.dart';

class AuthService {
  AuthService({
    required this.ref,
  });

  final Ref ref;

  Future<void> signInWithIdAndPassword(String uId, String password) async {
    final responseBody = await ref
        .read(authRepositoryProvider)
        .signInWithIdAndPassword(uId, password);

    ref
        .read(sharedPreferencesProvider)
        .setString('access', responseBody['access'] as String);
    ref
        .read(sharedPreferencesProvider)
        .setString('refresh', responseBody['refresh'] as String);

    fetchCurrentUserInfo(responseBody['access'] as String);
  }

  Future<void> refreshToken(String refreshToken) async {
    final response =
        await ref.read(authRepositoryProvider).refreshToken(refreshToken);
    ref
        .read(sharedPreferencesProvider)
        .setString('access', response['access'] as String);
  }

  Future<void> fetchCurrentUserInfo(String accessToken) async {
    final response =
        await ref.read(authRepositoryProvider).getCurrentUserInfo(accessToken);
    ref.read(authStateProvider.notifier).setUser(response);
  }

  Future<void> createUserWithIdAndPassword(
      String uId, String password, String fullName) async {
    final response = await ref
        .read(authRepositoryProvider)
        .createUserWithIdAndPassword(uId, password, fullName);

    ref.read(authStateProvider.notifier).setUser(response);
  }

  bool logOut() {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
    return true;
  }
}

final authServiceProvider = Provider((ref) {
  final service = AuthService(ref: ref);
  return service;
});
