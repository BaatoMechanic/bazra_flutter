import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoCardTheme {
  BaatoCardTheme._();

  static const lightCardTheme = CardTheme(
    color: ThemeColor.primary,
    shadowColor: ThemeColor.grey,
    clipBehavior: Clip.hardEdge,
  );

  static const darkCardTheme = CardTheme(
    color: ThemeColor.primary,
    shadowColor: ThemeColor.grey,
    clipBehavior: Clip.hardEdge,
  );
}
