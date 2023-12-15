import 'package:bato_mechanic/src/features/core/data/mechanic_repository/fake_mechanic_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_map_repository.dart';

abstract class MapRepository {
  getRoute(String sourcePoint, String destinationPoint);
  fetchLocationName(double lat, double lon);
  getSearchLocations(String searchText);
}

final mapRepositoryProvider = Provider((ref) => FakeMapRepository());
