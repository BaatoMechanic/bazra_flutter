import 'dart:io';

import 'package:bato_mechanic/src/features/vehicle_category/domain/vehicle_category/vehicle_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/user_settings.dart';
import '../../../shared/utils/constants/managers/api_values_manager.dart';
import '../../../shared/utils/http/http_client.dart';
import 'vehicle_category_repository.dart';
import 'package:http/http.dart' as http;

class APIVehicleCategoryRepository implements VehicleCategoryRepository {
  APIVehicleCategoryRepository({required this.ref});

  final Ref ref;

  @override
  Future<List<VehicleCategory>> fetchVehicleCategories() async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/vehicle-categories/');

    var response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
    return vehicleCategoriesFromJson(response);
  }

  @override
  Future<List<VehicleCategory>> fetchVehicleCategoriesForService(
      String serviceId) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}vehicle-repair/vehicle-categories/?services__idx=$serviceId');

    var response = await HttpHelper.guard(
        () => http.get(url, headers: {
              HttpHeaders.authorizationHeader:
                  'BM ${ref.read(sharedPreferencesProvider).getString("access")}',
            }),
        ref);
    return vehicleCategoriesFromJson(response);
  }
}
