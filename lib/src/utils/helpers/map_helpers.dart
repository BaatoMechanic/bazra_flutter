import 'package:bato_mechanic/src/features/core/application/location_service.dart';
import 'package:bato_mechanic/src/features/core/data/map_repository/fake_map_repository.dart';
import 'package:bato_mechanic/src/features/core/domain/user_position.dart';
import 'package:geolocator/geolocator.dart';

class MapHelper {
  static Future<UserPosition?> getUserLocation() async {
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

    String? locationName = await FakeMapRepository()
        .fetchLocationName(position.latitude, position.longitude);

    return UserPosition(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      timestamp: position.timestamp,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      locationName: locationName,
    );
  }
}
