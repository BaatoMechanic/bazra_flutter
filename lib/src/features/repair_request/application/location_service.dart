import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/user_position.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../utils/model_utils.dart';
import '../../auth/domain/user.dart';
import '../data/map_repository/request_mechanic_map_repository.dart';

class LocationService {
  LocationService({required this.ref});

  final Ref ref;

  initializeUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Geolocator.openLocationSettings();
      if (!serviceEnabled) {
        return;
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    position = await Geolocator.getCurrentPosition();

    String? locationName =
        await fetchLocationName(position.latitude, position.longitude);

    User? user = ref.read(authServiceProvider).currentUser;

    if (user == null) {
      return;
    }

    user = user.copyWith(
      currentLocation: UserPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        altitude: position.altitude,
        accuracy: position.accuracy,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy,
        heading: position.heading,
        timestamp: position.timestamp,
        locationName: locationName,
      ),
    );
    ref.read(authServiceProvider).setCurrentUser(user);
  }

  fetchLocationName(double lat, double lon) async {
    var response = await ref
        .read(requestMechanicMapRepositoryProvider)
        .fetchLocationName(lat, lon);

    if (response is Success) {
      return response.response;
    }

    if (response is Failure) {
      // state = state.copyWith(
      //     markerPosition:
      //         AsyncValue.error(response.errorResponse, response.stackTrace));
    }

    return null;
  }

  fetchSearchLocation(String searchText) async {
    var response = await ref
        .read(requestMechanicMapRepositoryProvider)
        .getSearchLocations(searchText);

    if (response is Success) {
      return Success(
        code: response.code,
        response: response.response,
      );
    }

    if (response is Failure) {
      // state = state.copyWith(
      //     markerPosition:
      //         AsyncValue.error(response.errorResponse, response.stackTrace));
    }

    return null;
  }
}

final locationServiceProvider = Provider((ref) {
  return LocationService(ref: ref);
});
