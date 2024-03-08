import 'dart:io';

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/api_values_manager.dart';

import 'package:http/http.dart' as http;

import '../../domain/user.dart';
import 'remote_auth_repository.dart';

class APIRemoteAuthRepository implements RemoteAuthRepository {
  APIRemoteAuthRepository({required this.ref});

  final Ref ref;

  @override
  Future<User> createUserWithIdAndPassword(
      String uId, String password, String fullName) async {
    var url =
        Uri.parse('${RemoteManager.BASE_URI}autho/users_management/register/');
    var response = await HttpHelper.guard(
        () => http.post(url, body: {
              "user_identifier": uId,
              "password": password,
              "name": fullName,
            }),
        ref);

    final String uIdx = response["idx"];

    response = await signInWithIdAndPassword(uId, password);

    // Setting the access and refresh tokens from repository only on this case because it access token is required to create a customer profile and thus sign in is needed here. But in other cases, saving aceess and refresh token should be done from services or other providers to maintain the convention
    String accessToken = response['access'] as String;
    ref.read(sharedPreferencesProvider).setString('access', accessToken);
    ref
        .read(sharedPreferencesProvider)
        .setString('refresh', response['refresh'] as String);

    url = Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/customers/');
    response = await HttpHelper.guard(
        () => http.post(
              url,
              headers: {HttpHeaders.authorizationHeader: 'BM $accessToken'},
              body: {
                "user_idx": uIdx,
              },
            ),
        ref);

    return User.fromJson(response);
  }

  @override
  Future<Map<String, dynamic>> signInWithIdAndPassword(
      String uId, String password) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/create-token/');

    final response = await HttpHelper.guard(
        () => http
            .post(url, body: {"user_identifier": uId, "password": password}),
        ref);
    return response;
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/refresh-token/');

    return await HttpHelper.guard(
        () => http.post(url, body: {"refresh": refreshToken}), ref);
  }

  @override
  Future<User> getCurrentUserInfo(String token) async {
    var url =
        Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/customers/me/');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader: 'BM $token',
            }),
        ref);

    return User.fromJson(response);
  }

  @override
  Future<void> signOut(Ref ref) async {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
  }
}
