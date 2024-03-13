import 'package:bato_mechanic/src/utils/constants/managers/api_values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

class UserHelperFunctions {
  static getProfileImageUrl(String url) {
    if (url[0] == '/') {
      url = url.substring(1);
    }
    return "${RemoteManager.BASE_URI}$url/";
  }

  static String getUserName(String? name) {
    if (name == null) {
      return '';
    }

    final List<String> splitStr = name.split(' ');
    for (int i = 0; i < splitStr.length; i++) {
      splitStr[i] =
          '${splitStr[i][0].toUpperCase()}${splitStr[i].substring(1)}';
    }
    final output = splitStr.join(' ');
    return output;
  }

  static String? getMechanicExpertise(Map<String, dynamic>? attributes) {
    if (attributes == null) {
      return '';
    }
    String? serviceSpeciality = attributes['service_speciality'];
    String? vehicleSpeciality = attributes['vehicle_speciality'];

    if (serviceSpeciality == null || vehicleSpeciality == null) {
      return null;
    }

    return "${(vehicleSpeciality).capitalize()}'s $serviceSpeciality";
  }
}
