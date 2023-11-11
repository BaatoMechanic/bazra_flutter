import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/text_selection_theme.dart';
import 'package:flutter/material.dart';

import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/input_decoration_theme.dart';
import 'widget_themes/text_theme.dart';

class BaatoAppTheme {
  BaatoAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: ThemeColor.grey,
    brightness: Brightness.light,
    primaryColor: ThemeColor.primary,
    primaryColorDark: ColorManager.primaryShade20,
    textTheme: BaatoTextTheme.lightTextTheme,
    chipTheme: BaatoChipTheme.lightChipTheme,
    scaffoldBackgroundColor: ThemeColor.white,
    appBarTheme: BaatoAppBarTheme.lightAppBarTheme,
    checkboxTheme: BaatoCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BaatoBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BaatoElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BaatoOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BaatoInputDecorationTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: ThemeColor.grey,
    brightness: Brightness.dark,
    primaryColor: ThemeColor.primary,
    primaryColorDark: ColorManager.primaryShade20,
    textTheme: BaatoTextTheme.darkTextTheme,
    textSelectionTheme: BaatoTextSelectionTheme.lightTextSelectionTheme,
    chipTheme: BaatoChipTheme.darkChipTheme,
    scaffoldBackgroundColor: ThemeColor.black,
    appBarTheme: BaatoAppBarTheme.darkAppBarTheme,
    checkboxTheme: BaatoCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: BaatoBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BaatoElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BaatoOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BaatoInputDecorationTheme.darkInputDecorationTheme,
  );
}
