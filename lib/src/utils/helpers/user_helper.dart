import 'package:bato_mechanic/src/utils/constants/managers/api_values_manager.dart';

class UserHelperFunctions {
  static getProfileImageUrl(String url) {
    return "${RemoteManager.BASE_URI}$url/";
  }
}
