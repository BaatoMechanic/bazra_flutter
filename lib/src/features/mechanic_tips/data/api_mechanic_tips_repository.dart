import 'dart:io';

import 'package:bato_mechanic/src/features/mechanic_tips/data/mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/shared/utils/http/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/providers/user_settings.dart';
import '../../../shared/utils/constants/managers/api_values_manager.dart';
import 'package:http/http.dart' as http;

import '../domain/mechanic_tip/mechanic_tip.dart';

class APIMechanicTipsRepository implements MechanicTipsRepository {
  APIMechanicTipsRepository(this.ref);

  final Ref ref;

  @override
  Future<List<MechanicTip>> fetchMechanicTips() async {
    var url =
        Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/mechanic_tips/');

    final response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);

    return mechanicTipsFromJson(response);
  }
}
