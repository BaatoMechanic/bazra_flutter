import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';

import '../../constants/managers/color_manager.dart';
import '../../constants/managers/default_manager.dart';

/* -- Light & Dark Elevated Button Themes -- */
class BaatoElevatedButtonTheme {
  BaatoElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      // foregroundColor: ThemeColor.light,
      foregroundColor: ThemeColor.dark,
      backgroundColor: ThemeColor.primary,
      disabledForegroundColor: ThemeColor.darkGrey,
      disabledBackgroundColor: ThemeColor.buttonDisabled,
      side: const BorderSide(color: ThemeColor.transparent),
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p4,
        horizontal: AppPadding.p8,
      ),
      textStyle: const TextStyle(
          fontSize: 16,
          color: ThemeColor.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultManager.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      // foregroundColor: ThemeColor.light,
      foregroundColor: ThemeColor.dark,
      backgroundColor: ThemeColor.primary,
      disabledForegroundColor: ThemeColor.darkGrey,
      disabledBackgroundColor: ThemeColor.darkerGrey,
      side: const BorderSide(color: ThemeColor.transparent),
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p4,
        horizontal: AppPadding.p8,
      ),
      textStyle: const TextStyle(
          fontSize: 16,
          color: ThemeColor.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DefaultManager.buttonRadius)),
    ),
  );
}
