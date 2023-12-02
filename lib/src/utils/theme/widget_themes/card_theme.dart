import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoCardTheme {
  BaatoCardTheme._();

  static final lightCardTheme = CardTheme(
    color: ThemeColor.primary,
    shadowColor: ThemeColor.grey,
    clipBehavior: Clip.hardEdge,
  );

  static final darkCardTheme = CardTheme(
    color: ThemeColor.primary,
    shadowColor: ThemeColor.grey,
    clipBehavior: Clip.hardEdge,
  );
}
