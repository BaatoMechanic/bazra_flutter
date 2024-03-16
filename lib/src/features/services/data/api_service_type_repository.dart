import 'dart:io';

import 'package:bato_mechanic/src/features/services/data/service_type_repository.dart';
import 'package:bato_mechanic/src/features/services/domain/service/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/user_settings.dart';
import '../../../shared/utils/constants/managers/api_values_manager.dart';
import 'package:http/http.dart' as http;

import '../../../shared/utils/http/http_client.dart';

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
    return servicesFromJson(response);
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
