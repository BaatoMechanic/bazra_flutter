import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_map_repository.dart';

abstract class MapRepository {
  getRoute(String sourcePoint, String destinationPoint);
  fetchLocationName(double lat, double lon);
  getSearchLocations(String searchText);
}

final mapRepositoryProvider = Provider((ref) => FakeMapRepository());
