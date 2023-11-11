import 'package:flutter/material.dart';

import '../../constants/managers/color_manager.dart';
import '../../constants/managers/default_manager.dart';

/* -- Light & Dark Outlined Button Themes -- */
class BaatoOutlinedButtonTheme {
  BaatoOutlinedButtonTheme._();

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ThemeColor.dark,
      side: const BorderSide(color: ThemeColor.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: ThemeColor.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: DefaultManager.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultManager.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ThemeColor.light,
      side: const BorderSide(color: ThemeColor.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16,
          color: ThemeColor.textWhite,
          fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: DefaultManager.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultManager.buttonRadius)),
    ),
  );
}
