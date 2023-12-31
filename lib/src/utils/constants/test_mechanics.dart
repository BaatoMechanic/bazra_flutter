import 'package:bato_mechanic/src/features/repair_request/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/user_position.dart';
import 'package:latlong2/latlong.dart';

final mTestMechanics = [
  Mechanic(
    id: 1,
    userId: 2,
    name: "Krishna Rimal",
    phoneNumber: "9808144809",
    username: "mechanicUser",
    email: "mail@mechanic.com",
    description: "I am a mechanic",
    image: "http://localhost:8000/media/store/images/mechanic/mechanic.png",
    vehicleCategorySpeciality: "bike",
    vehiclePartSpeciality: "wheel",
    // currentLocationCoordinates: LatLng(85.33825904130937, 27.707645262018172),
    currentLocation: UserPosition(
      accuracy: 99,
      longitude: 85.33825904130937,
      latitude: 27.707645262018172,
      timestamp: DateTime.now(),
      locationName: "Kohalpur",
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
    ),
    // currentLocationName: "Kohalpur",
    averageRating: 0,
  ),
  Mechanic(
    id: 2,
    userId: 3,
    name: "Krishna Shrish",
    phoneNumber: "9808144809",
    username: "mechanicUser",
    email: "mail@mechanic.com",
    description: "I am a mechanic",
    image: "http://localhost:8000/media/store/images/mechanic/mechanic.png",
    vehicleCategorySpeciality: "bike",
    vehiclePartSpeciality: "wheel",
    currentLocation: UserPosition(
      accuracy: 99,
      longitude: 85.33825904130937,
      latitude: 27.707645262018172,
      timestamp: DateTime.now(),
      locationName: "Kohalpur",
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
    ),
    averageRating: 0,
  ),
];
