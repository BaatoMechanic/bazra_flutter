import '../../features/auth/domain/mechanic/mechanic.dart';
import '../enums/dob_type.dart';

final mTestMechanics = [
  Mechanic(
    idx: '1',
    name: "Krishna Rimal",
    phone: "9808144809",
    email: "mail@mechanic.com",
    primaryRole: 'mechanic',
    roles: [],
    gender: "Male",
    dateOfBirth: DateTime.now(),
    dobType: DOBType.AD,
    vehicleSpecialityIdx: "1",
    serviceSpecialityIdx: "1",
    description: "I am a mechanic",

    additionalAttributes: {
      "vehicleCategorySpeciality": "bike",
      "vehiclePartSpeciality": "wheel",
    },
    profilePic:
        "http://localhost:8000/media/store/images/mechanic/mechanic.png",
    // currentLocation: UserPosition(
    //   accuracy: 99,
    //   longitude: 85.33825904130937,
    //   latitude: 27.707645262018172,
    //   timestamp: DateTime.now(),
    //   locationName: "Kohalpur",
    //   altitude: 0,
    //   heading: 0,
    //   speed: 0,
    //   speedAccuracy: 0,
    // ),
  ),
  // Mechanic(
  //   idx: '2',
  //   userId: 3,
  //   name: "Krishna Shrish",
  //   phoneNumber: "9808144809",
  //   username: "mechanicUser",
  //   email: "mail@mechanic.com",
  //   description: "I am a mechanic",
  //   image: "http://localhost:8000/media/store/images/mechanic/mechanic.png",
  //   vehicleCategorySpeciality: "bike",
  //   vehiclePartSpeciality: "wheel",
  //   currentLocation: UserPosition(
  //     accuracy: 99,
  //     longitude: 85.33825904130937,
  //     latitude: 27.707645262018172,
  //     timestamp: DateTime.now(),
  //     locationName: "Kohalpur",
  //     altitude: 0,
  //     heading: 0,
  //     speed: 0,
  //     speedAccuracy: 0,
  //   ),
  //   averageRating: 0,
  // ),
];
