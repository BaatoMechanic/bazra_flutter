import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/style_manager.dart';
import 'package:flutter/material.dart';

import '../../constants/managers/color_manager.dart';
import '../../constants/managers/default_manager.dart';

class BaatoTextButtonTheme {
  BaatoTextButtonTheme._();

  /* -- Light Theme -- */
  static final lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle().copyWith(
      textStyle: MaterialStatePropertyAll<TextStyle>(
        TextStyle().copyWith(color: ThemeColor.dark),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle().copyWith(
      textStyle: MaterialStatePropertyAll<TextStyle>(
        TextStyle().copyWith(
          fontSize: FontSize.s14,
          color: ThemeColor.primary,
          backgroundColor: ThemeColor.error,
        ),
      ),
    ),
  );
}
