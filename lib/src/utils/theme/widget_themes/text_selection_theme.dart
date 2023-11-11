import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoTextSelectionTheme {
  BaatoTextSelectionTheme._();

  static const TextSelectionThemeData lightTextSelectionTheme =
      TextSelectionThemeData(
    cursorColor: ThemeColor.primary,
    selectionColor: ThemeColor.black,
    selectionHandleColor: ThemeColor.accent,
  );
}
