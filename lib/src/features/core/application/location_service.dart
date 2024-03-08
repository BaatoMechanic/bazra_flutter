import 'package:bato_mechanic/src/features/core/data/map_repository/map_repository.dart';
import 'package:bato_mechanic/src/features/core/domain/user_position/user_position.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../utils/model_utils.dart';

class LocationService {
  LocationService({required this.ref});

  final Ref ref;

  Future<UserPosition?> initializeUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return null;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return null;
      }
    }

    position = await Geolocator.getCurrentPosition();

    String? locationName =
        await fetchLocationName(position.latitude, position.longitude);

    UserPosition userPosition = UserPosition(
      latitude: position.latitude,
      longitude: position.longitude,
      altitude: position.altitude,
      accuracy: position.accuracy,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      heading: position.heading,
      timestamp: position.timestamp,
      locationName: locationName,
    );
    return userPosition;
  }

  fetchLocationName(double lat, double lon) async {
    var response =
        await ref.read(mapRepositoryProvider).fetchLocationName(lat, lon);

    if (response is Success) {
      return response.response;
    }

    if (response is Failure) {}

    return null;
  }

  // fetchSearchLocation(String searchText) async {
  //   var response =
  //       await ref.read(mapRepositoryProvider).getSearchLocations(searchText);

  //   if (response is Success) {
  //     return Success(
  //       code: response.code,
  //       response: response.response,
  //     );
  //   }

  //   if (response is Failure) {
  //     // state = state.copyWith(
  //     //     markerPosition:
  //     //         AsyncValue.error(response.errorResponse, response.stackTrace));
  //   }

  //   return null;
  // }
}

final locationServiceProvider = Provider((ref) {
  return LocationService(ref: ref);
});

final userCurrentLocationProvider = FutureProvider<UserPosition?>((ref) {
  final service = ref.watch(locationServiceProvider);
  return service.initializeUserLocation();
});
