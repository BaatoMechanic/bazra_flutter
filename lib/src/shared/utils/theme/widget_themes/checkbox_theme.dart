import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';

import '../../constants/managers/color_manager.dart';

/// Custom Class for Light & Dark Text Themes
class BaatoCheckboxTheme {
  BaatoCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r8)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ThemeColor.white;
      } else {
        return ThemeColor.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ThemeColor.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r8)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ThemeColor.white;
      } else {
        return ThemeColor.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return ThemeColor.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
