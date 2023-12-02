import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoTextSelectionTheme {
  BaatoTextSelectionTheme._();

  static TextSelectionThemeData lightTextSelectionTheme =
      TextSelectionThemeData(
    cursorColor: ThemeColor.primary,
    selectionColor: ColorManager.primaryShade30,
    selectionHandleColor: ThemeColor.primary,
  );

  static const TextSelectionThemeData darkTextSelectionTheme =
      TextSelectionThemeData(
    cursorColor: ThemeColor.primary,
    selectionColor: ThemeColor.black,
    selectionHandleColor: ThemeColor.primary,
  );
}
