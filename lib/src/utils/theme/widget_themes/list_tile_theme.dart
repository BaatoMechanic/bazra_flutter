import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoListTileTheme {
  BaatoListTileTheme._();

  static ListTileThemeData lightListTileThemeData = ListTileThemeData(
    iconColor: ThemeColor.dark,
    textColor: ThemeColor.dark,
  );

  static ListTileThemeData darkListTileThemeData = ListTileThemeData(
    iconColor: ThemeColor.black,
    textColor: ThemeColor.black,
  );
}
