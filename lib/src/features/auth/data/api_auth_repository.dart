import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/common/core/repositories/user_settings_repository.dart';
import 'package:bato_mechanic/src/features/auth/data/auth_repository.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/managers/api_values_manager.dart';

import 'package:http/http.dart' as http;

import '../../../utils/constants/managers/strings_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';

class APIAuthRepository implements AuthRepository {
  APIAuthRepository({required this.ref});

  final Ref ref;

  @override
  Future createUserWithIdAndPassword(String uId, String password) {
    // TODO: implement createUserWithIdAndPassword
    throw UnimplementedError();
  }

  @override
  Future signInWithIdAndPassword(String uId, String password) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/create-token/');

    return await HttpHelper.guard(
        () => http
            .post(url, body: {"user_identifier": uId, "password": password}),
        ref);
  }

  @override
  Future refreshToken(String refreshToken) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/refresh-token/');

    return await HttpHelper.guard(
        () => http.post(url, body: {"refresh": refreshToken}), ref);
  }

  @override
  Future getCurrentUserInfo(String token) async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/user_info/me/');

    return await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader: 'BM $token',
            }),
        ref);
  }

  @override
  void signOut(Ref ref) {
    ref.read(sharedPreferencesProvider).remove('access');
    ref.read(sharedPreferencesProvider).remove('refresh');
  }
}
