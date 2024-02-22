import 'package:bato_mechanic/src/utils/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:intl/intl.dart';

class BaatoDateFormatter {
  static String formatMinutesToGeneric(int minutes) {
    if (minutes == -1.intHardcoded()) {
      return "Unknown";
    }
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    // Construct the result string based on the hour and minute values
    String result = '';
    if (hours > 0) {
      result += '$hours hour';
      if (hours != 1) {
        result += 's'; // Add plural 's' if hours is not equal to 1
      }
      result += ' and ';
    }
    result += '$remainingMinutes minute';
    if (remainingMinutes != 1) {
      result += 's'; // Add plural 's' if remainingMinutes is not equal to 1
    }

    if (hours == 0 && minutes == 0.intHardcoded()) {
      result = "Almost Arrived".hardcoded();
    }

    return result;
  }

  static String formatSecondsToGeneric(int seconds) {
    if (seconds == -1.intHardcoded()) {
      return "Unknown";
    }
    int minutes = seconds ~/ 60;

    return formatMinutesToGeneric(minutes);
  }

  static String humanizeDateTime(DateTime dateTime) {
    final day = DateFormat('d').format(dateTime);
    final month = DateFormat('MMMM').format(dateTime);
    final year = DateFormat('y').format(dateTime);

    // Add the appropriate suffix for the day
    String suffix;
    if (day.endsWith('1') && day != '11') {
      suffix = 'st';
    } else if (day.endsWith('2') && day != '12') {
      suffix = 'nd';
    } else if (day.endsWith('3') && day != '13') {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    return '$day$suffix $month, $year';
  }
}
