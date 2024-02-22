import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/core/data/map_repository/api_map_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'fake_map_repository.dart';

abstract class MapRepository {
  // Future<List<LatLng>> getRoute(LatLng sourcePoint, LatLng destinationPoint);
  Future<Map<String, dynamic>> getRoute(
      LatLng sourcePoint, LatLng destinationPoint);
  fetchLocationName(double lat, double lon);
  getSearchLocations(String searchText);
}

final mapRepositoryProvider = Provider(
    (ref) => SHOW_FAKE ? FakeMapRepository() : APIMapRepository(ref: ref));
