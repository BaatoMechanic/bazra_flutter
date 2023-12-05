// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/auth/data/auth_repository.dart';
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

      fetchUserInfo(responseBody['access'] as String);
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

  Future<void> fetchUserInfo(String token) async {
    final response = await ref.read(authRepositoryProvider).getUserInfo(token);

    if (response is Success) {
      User user = User.fromJson(jsonDecode((jsonEncode(response.response))));
      ref.read(userServiceProvider).setCurrentUser(user);
    }

    if (response is Failure) {
      throw BaseException(message: response.errorResponse.toString());
    }
  }

  Future<void> createUserWithIdAndPassword(String uId, String password) async {
    final response = await ref
        .read(authRepositoryProvider)
        .createUserWithIdAndPassword(uId, password);

    if (response is Success) {
      User user = User.fromJson(jsonEncode(response.response));
      ref.read(userServiceProvider).setCurrentUser(user);
    }
  }

  bool logOut() {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
    ref.read(userServiceProvider).setCurrentUser(null);
    return true;
  }
}

final authServiceProvider = Provider((ref) {
  return AuthService(ref: ref);
});
