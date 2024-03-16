import 'package:bato_mechanic/src/shared/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/managers/color_manager.dart';
import '../../constants/managers/values_manager.dart';

class BaatoSearchBarTheme {
  BaatoSearchBarTheme._();

  static final lightSearchBarTheme = SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll<Color>(
      ColorManager.primaryTint60,
    ),
    textStyle: MaterialStatePropertyAll<TextStyle>(
      const TextStyle().copyWith(
        color: ThemeColor.dark,
      ),
    ),
    surfaceTintColor:
        const MaterialStatePropertyAll<Color>(ThemeColor.transparent),
    overlayColor: const MaterialStatePropertyAll<Color>(ThemeColor.white),
    elevation: MaterialStatePropertyAll(0.0.doubleHardcoded()),
    shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppRadius.r32),
      ),
    )),
    constraints: const BoxConstraints(maxHeight: AppHeight.h50),
  );

  static final darkSearchBarTheme = SearchBarThemeData(
    backgroundColor: MaterialStatePropertyAll<Color>(
      ColorManager.primaryTint60,
    ),
    textStyle: MaterialStatePropertyAll<TextStyle>(
      const TextStyle().copyWith(
        color: ThemeColor.dark,
      ),
    ),
    surfaceTintColor:
        const MaterialStatePropertyAll<Color>(ThemeColor.transparent),
    overlayColor: const MaterialStatePropertyAll<Color>(ThemeColor.white),
    elevation: MaterialStatePropertyAll(0.0.doubleHardcoded()),
    shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppRadius.r32),
      ),
    )),
    constraints: const BoxConstraints(maxHeight: AppHeight.h50),
  );
}
