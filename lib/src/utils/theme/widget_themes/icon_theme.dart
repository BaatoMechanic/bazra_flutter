import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoIconTheme {
  BaatoIconTheme._();

  static final lightIconTheme = IconThemeData(
    color: ThemeColor.dark,
  );

  static final darkIconTheme = IconThemeData(
    color: ThemeColor.light,
  );
}
