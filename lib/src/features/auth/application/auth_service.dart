// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/auth/data/auth_repository.dart';
import 'package:bato_mechanic/src/utils/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/auth/domain/user.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';
import 'package:http/http.dart';

import '../../../utils/exceptions/base_exception.dart';

class AuthService {
  AuthService({
    required this.ref,
  });

  final Ref ref;

  final _userState = InMemoryStore<User?>(null);

  Stream<User?> userStateChanges() => _userState.stream;
  User? get currentUser => _userState.value;

  void setCurrentUser(User? user) => _userState.value = user;

  void dispose() => _userState.close();

  Future<void> signInWithIdAndPassword(String uId, String password) async {
    final response = await ref
        .read(authRepositoryProvider)
        .signInWithIdAndPassword(uId, password);

    if (response is Success) {
      Map<String, dynamic> responseBody =
          jsonDecode((response.response as Response).body);

      ref
          .read(sharedPreferencesProvider)
          .setString('access', responseBody['access'] as String);
      ref
          .read(sharedPreferencesProvider)
          .setString('refresh', responseBody['refresh'] as String);

      fetchCurrentUserInfo(responseBody['access'] as String);
    }

    if (response is Failure) {
      throw BaseException(message: response.errorResponse.toString());
    }
  }

  Future<void> refreshToken(String refreshToken) async {
    final response =
        await ref.read(authRepositoryProvider).refreshToken(refreshToken);
    if (response is Success) {
      Map<String, dynamic> responseBody =
          jsonDecode(response.response as String);

      ref
          .read(sharedPreferencesProvider)
          .setString('access', responseBody['access'] as String);

      return;
    }
    if (response is Failure) {
      throw BaseException(message: response.errorResponse.toString());
    }
  }

  Future<void> fetchCurrentUserInfo(String accessToken) async {
    final response =
        await ref.read(authRepositoryProvider).getCurrentUserInfo(accessToken);

    if (response is Success) {
      User user = User.fromJson(jsonDecode((jsonEncode(response.response))));
      setCurrentUser(user);
      return;
    }

    if (response is Failure) {
      if (response.code == 401.intHardcoded()) {
        await refreshToken(
            ref.read(sharedPreferencesProvider).getString('refresh')!);
        await fetchCurrentUserInfo(
            ref.read(sharedPreferencesProvider).getString('access')!);
        return;
      }

      throw BaseException(message: response.errorResponse.toString());
    }
  }

  Future<void> createUserWithIdAndPassword(String uId, String password) async {
    final response = await ref
        .read(authRepositoryProvider)
        .createUserWithIdAndPassword(uId, password);

    if (response is Success) {
      User user = User.fromJson(jsonEncode(response.response));
      setCurrentUser(user);
    }
  }

  bool logOut() {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
    setCurrentUser(null);
    return true;
  }
}

final authServiceProvider = Provider((ref) {
  final service = AuthService(ref: ref);
  ref.onDispose(() => service.dispose());
  return service;
});

final watchUserStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.userStateChanges();
});
