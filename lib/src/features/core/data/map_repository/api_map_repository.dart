import 'package:bato_mechanic/src/features/core/data/map_repository/map_repository.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/api_values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:http/http.dart" as http;

import '../../../../shared/utils/http/http_client.dart';
import 'package:latlong2/latlong.dart';

class APIMapRepository implements MapRepository {
  APIMapRepository({required this.ref});

  final Ref ref;

  @override
  fetchLocationName(double lat, double lon) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}gis/reverse-geocode/?lat=$lat&lon=$lon');

    final response = await HttpHelper.guard(() => http.get(url), ref);
    return {
      "display_name": response["display_name"],
      "lat": response["lat"],
      "lon": response["lon"],
    };
  }

  @override
  Future<Map<String, dynamic>> getRoute(
      LatLng sourcePoint, LatLng destinationPoint) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}gis/route/?source_lon=${sourcePoint.longitude}&source_lat=${sourcePoint.latitude}&destination_lon=${destinationPoint.longitude}&destination_lat=${destinationPoint.latitude}');

    final response = await HttpHelper.guard(() => http.get(url), ref);
    var listOfCoordinatePoints = [];
    for (var i = 0; i < response['routes'][0]["legs"][0]["steps"].length; i++) {
      var innerList = response['routes'][0]["legs"][0]["steps"][i]['geometry'];
      listOfCoordinatePoints.addAll(innerList);
    }

    List<LatLng> routeCoordinates = listOfCoordinatePoints
        .map((point) => LatLng(point[1].toDouble(), point[0].toDouble()))
        .toList()
        .cast<LatLng>();

    return {
      "routeCoordinates": routeCoordinates,
      "duration": response['routes'][0]["duration"],
    };
  }

  @override
  getSearchLocations(String searchText) async {
    var url = Uri.parse(
        '${RemoteManager.BASE_URI}gis/location-search/?search=$searchText');

    final response = await HttpHelper.guard(() => http.get(url), ref);
    return response;
  }
}
