import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/api_values_manager.dart';

import 'package:http/http.dart' as http;

import '../../domain/user.dart';
import '../../domain/user_back.dart';
import 'remote_auth_repository.dart';

class APIRemoteAuthRepository implements RemoteAuthRepository {
  APIRemoteAuthRepository({required this.ref});

  final Ref ref;

  @override
  Future<User> createUserWithIdAndPassword(String uId, String password) {
    // TODO: implement createUserWithIdAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signInWithIdAndPassword(
      String uId, String password) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/create-token/');

    final response = await HttpHelper.guard(
        () => http
            .post(url, body: {"user_identifier": uId, "password": password}),
        ref);
    return jsonDecode(response);
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

    return User.fromJson(jsonDecode(response));
  }

  @override
  Future<void> signOut(Ref ref) async {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
  }
}
