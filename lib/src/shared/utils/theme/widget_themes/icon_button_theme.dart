import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoIconButtonTheme {
  BaatoIconButtonTheme._();
  static final IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: const ButtonStyle().copyWith(
      backgroundColor:
          const MaterialStatePropertyAll<Color>(ThemeColor.primary),
      iconColor: const MaterialStatePropertyAll<Color>(ThemeColor.dark),
    ),
  );

  static final IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: const ButtonStyle().copyWith(
      backgroundColor:
          const MaterialStatePropertyAll<Color>(ThemeColor.primary),
      iconColor: const MaterialStatePropertyAll<Color>(ThemeColor.dark),
    ),
  );
}
