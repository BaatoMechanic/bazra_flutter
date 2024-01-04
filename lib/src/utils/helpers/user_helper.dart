import 'package:bato_mechanic/src/utils/constants/managers/api_values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

class UserHelperFunctions {
  static getProfileImageUrl(String url) {
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

  static String getMechanicExpertise(Map<String, dynamic>? attributes) {
    if (attributes == null) {
      return '';
    }
    String? partSpeciality = attributes['vehicle_part'];
    String? vehicleSpeciality = attributes['vehicle_category'];

    return "${(vehicleSpeciality as String).capitalize()}'s $partSpeciality";
  }
}
