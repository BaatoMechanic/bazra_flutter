import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class BaatoChipTheme {
  BaatoChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ThemeColor.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: ThemeColor.black),
    selectedColor: ThemeColor.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ThemeColor.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: ThemeColor.darkerGrey,
    labelStyle: TextStyle(color: ThemeColor.white),
    selectedColor: ThemeColor.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: ThemeColor.white,
  );
}
