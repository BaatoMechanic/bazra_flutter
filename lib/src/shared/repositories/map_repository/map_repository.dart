import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/shared/repositories/map_repository/api_map_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_map_repository.dart';

part 'map_repository.g.dart';

abstract class MapRepository {
  Future<Map<String, dynamic>> getRoute(
      LatLng sourcePoint, LatLng destinationPoint);
  fetchLocationName(double lat, double lon);
  getSearchLocations(String searchText);
}

@riverpod
MapRepository mapRepository(MapRepositoryRef ref) =>
    SHOW_FAKE ? FakeMapRepository() : APIMapRepository(ref: ref);
