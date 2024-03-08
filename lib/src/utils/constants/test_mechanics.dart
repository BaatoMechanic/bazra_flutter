import '../../features/auth/domain/mechanic.dart';
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
  ),
];
