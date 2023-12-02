import 'package:bato_mechanic/src/features/repair_request/data/map_repository/fake_request_mechanic_map_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/data/mechanic_repository/fake_mechanic_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RequestMechanicMapRepository {
  getRoute(String sourcePoint, String destinationPoint);
  fetchLocationName(double lat, double lon);
  getSearchLocations(String searchText);
}

final requestMechanicMapRepositoryProvider =
    Provider((ref) => FakeRequestMechanicMapRepository());
