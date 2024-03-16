import 'dart:convert';
import 'dart:io';

import 'package:bato_mechanic/src/shared/utils/exceptions/base_exception.dart';
import 'package:http/http.dart' as http;

import '../../../../shared/utils/constants/managers/strings_manager.dart';
import '../../../../shared/utils/constants/managers/values_manager.dart';
import 'map_repository.dart';
import 'package:latlong2/latlong.dart';

class FakeMapRepository implements MapRepository {
  @override
  Future<Map<String, dynamic>> getRoute(
      LatLng sourcePoint, LatLng destinationPoint) async {
    var url = Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=5b3ce3597851110001cf6248b60a25fd6a3d4feebc3315580a66b8e8&start=$sourcePoint&end=$destinationPoint');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var listOfCoordinatePoints =
          data['features'][0]['geometry']['coordinates'];

      return {"coordinatres": listOfCoordinatePoints};
    }
    return {};
  }

  @override
  getSearchLocations(String searchText) async {
    try {
      String url =
          'https://nominatim.openstreetmap.org/search?q=$searchText&format=json&polygon_geojson=1&addressdetails=1&accept-language=en';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      }
      return BaseException(
        stackTrace: StackTrace.current,
        message: ApiStrings.invalidResponseString,
      );
    } on HttpException {
      return BaseException(
        stackTrace: StackTrace.current,
        message: ApiStrings.noInternetString,
      );
    } on FormatException {
      return BaseException(
        stackTrace: StackTrace.current,
        message: ApiStrings.invalidFormatString,
      );
    } catch (e) {
      throw BaseException(
          message: ApiStrings.unknownErrorString,
          stackTrace: StackTrace.current);
    }
  }

  @override
  fetchLocationName(double latitude, double longitude) async {
    try {
      String url =
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1&accept-language=en';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == ApiStatusCode.responseSuccess) {
        return json.decode(response.body)['display_name'];
      }
      throw BaseException(
        stackTrace: StackTrace.current,
        message: ApiStrings.invalidResponseString,
      );
    } on HttpException {
      throw BaseException(
        stackTrace: StackTrace.current,
        message: ApiStrings.noInternetString,
      );
    } on FormatException {
      throw BaseException(
        stackTrace: StackTrace.current,
        message: ApiStrings.invalidFormatString,
      );
    } catch (e, st) {
      throw BaseException(
        stackTrace: st,
        message: ApiStrings.unknownErrorString,
      );
    }
  }
}
