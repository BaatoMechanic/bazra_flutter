import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoListTileTheme {
  BaatoListTileTheme._();

  static ListTileThemeData lightListTileThemeData = const ListTileThemeData(
    iconColor: ThemeColor.dark,
    textColor: ThemeColor.dark,
  );

  static ListTileThemeData darkListTileThemeData = const ListTileThemeData(
    iconColor: ThemeColor.black,
    textColor: ThemeColor.black,
  );
}
