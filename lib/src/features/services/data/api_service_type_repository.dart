import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/services/data/service_type_repository.dart';
import 'package:bato_mechanic/src/features/services/domain/service_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/core/repositories/user_settings_repository.dart';
import '../../../utils/constants/managers/api_values_manager.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constants/managers/strings_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/model_utils.dart';

class APIServiceTypeRepository implements ServiceTypeRepository {
  APIServiceTypeRepository(this.ref);
  final Ref ref;

  @override
  Future<List<Service>> fetchAllServiceTypes() async {
    var url = Uri.parse('${RemoteManager.BASE_URI}vehicle-repair/services/');

    var response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
    return serviceTypesFromJson(jsonDecode(response));
  }

  @override
  Future<Service> fetchRepairRequestServiceType(String repairRequestIdx) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/repair_requests/$repairRequestIdx/service_type/');

    var response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
    return Service.fromJson(response);
  }
}
