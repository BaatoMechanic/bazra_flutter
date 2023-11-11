import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoIconButtonTheme {
  BaatoIconButtonTheme._();
  static final IconButtonThemeData lightIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle().copyWith(
      // backgroundColor: MaterialStatePropertyAll<Color>(ThemeColor.),
      iconColor: MaterialStatePropertyAll<Color>(ThemeColor.dark),
    ),
  );

  static final IconButtonThemeData darkIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle().copyWith(
      // backgroundColor: MaterialStatePropertyAll<Color>(ThemeColor.),
      iconColor: MaterialStatePropertyAll<Color>(ThemeColor.dark),
    ),
  );
}
