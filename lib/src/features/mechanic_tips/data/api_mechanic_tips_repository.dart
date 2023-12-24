import 'dart:io';

import 'package:bato_mechanic/src/features/mechanic_tips/data/mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/core/repositories/user_settings_repository.dart';
import '../../../utils/constants/managers/api_values_manager.dart';
import 'package:http/http.dart' as http;


class APIMechanicTipsRepository implements MechanicTipsRepository {
  APIMechanicTipsRepository(this.ref);

  final Ref ref;

  @override
  Future<dynamic> fetchMechanicTips() async {
    var url = Uri.parse('${RemoteManager.BASE_URI}autho/mechanic_tips/');

    return await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
  }
}
