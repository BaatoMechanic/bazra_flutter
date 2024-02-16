import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/features/core/data/map_repository/map_repository.dart';
import 'package:bato_mechanic/src/utils/constants/managers/api_values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;

import '../../../../utils/constants/managers/strings_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/http/http_client.dart';
import '../../../../utils/model_utils.dart';
import 'package:latlong2/latlong.dart';

class APIMapRepository implements MapRepository {
  APIMapRepository({required this.ref});

  final Ref ref;

  @override
  fetchLocationName(double lat, double lon) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}gis/reverse-geocode/?lat=$lat&lon=$lon');

    final response = await HttpHelper.guard(() => http.get(url), ref);
    Map<String, dynamic> data = jsonDecode(response);
    return {
      "display_name": data["display_name"],
      "lat": data["lat"],
      "lon": data["lon"],
    };
  }

  @override
  // Future<List<LatLng>> getRoute(
  Future<Map<String, dynamic>> getRoute(
      LatLng sourcePoint, LatLng destinationPoint) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}gis/route/?source_lon=${sourcePoint.longitude}&source_lat=${sourcePoint.latitude}&destination_lon=${destinationPoint.longitude}&destination_lat=${destinationPoint.latitude}');

    final response = await HttpHelper.guard(() => http.get(url), ref);
    final data = jsonDecode(response);
    var listOfCoordinatePoints = [];
    // data['routes'][0]["legs"][0]["steps"][0]['geometry'];
    for (var i = 0; i < data['routes'][0]["legs"][0]["steps"].length; i++) {
      var innerList = data['routes'][0]["legs"][0]["steps"][i]['geometry'];
      listOfCoordinatePoints.addAll(innerList);
    }

    List<LatLng> routeCoordinates = listOfCoordinatePoints
        .map((point) => LatLng(point[1].toDouble(), point[0].toDouble()))
        .toList()
        .cast<LatLng>();

    return {
      "routeCoordinates": routeCoordinates,
      "duration": data['routes'][0]["duration"],
    };
  }

  @override
  getSearchLocations(String searchText) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}gis/location-search/?search=$searchText');

    final response = await HttpHelper.guard(() => http.get(url), ref);
    return jsonDecode(response);
  }
}
