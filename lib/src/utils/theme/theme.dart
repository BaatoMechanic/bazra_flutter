// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/theme/widget_themes/searchbar_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/card_theme.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/icon_button_theme.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/icon_theme.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/list_tile_theme.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/slider_theme.dart';
import 'package:bato_mechanic/src/utils/theme/widget_themes/text_selection_theme.dart';

import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/input_decoration_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_theme.dart';

class BaatoAppTheme {
  BaatoAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    fontFamily: FontConstants.fontFamily,
    disabledColor: ThemeColor.grey,
    brightness: Brightness.light,
    primaryColor: ThemeColor.primary,
    primaryColorDark: ColorManager.primaryShade20,
    textTheme: BaatoTextTheme.lightTextTheme,
    textSelectionTheme: BaatoTextSelectionTheme.lightTextSelectionTheme,
    inputDecorationTheme: BaatoInputDecorationTheme.lightInputDecorationTheme,
    chipTheme: BaatoChipTheme.lightChipTheme,
    listTileTheme: BaatoListTileTheme.lightListTileThemeData,
    scaffoldBackgroundColor: ThemeColor.white,
    appBarTheme: BaatoAppBarTheme.lightAppBarTheme,
    checkboxTheme: BaatoCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: BaatoBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BaatoElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BaatoOutlinedButtonTheme.lightOutlinedButtonTheme,
    iconTheme: BaatoIconTheme.lightIconTheme,
    iconButtonTheme: BaatoIconButtonTheme.lightIconButtonTheme,
    cardTheme: BaatoCardTheme.lightCardTheme,
    sliderTheme: BaatoSliderTheme.lightSliderTheme,
    searchBarTheme: BaatoSearchBarTheme.lightSearchBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    fontFamily: FontConstants.fontFamily,
    disabledColor: ThemeColor.grey,
    brightness: Brightness.dark,
    primaryColor: ThemeColor.primary,
    primaryColorDark: ColorManager.primaryShade20,
    textTheme: BaatoTextTheme.darkTextTheme,
    textSelectionTheme: BaatoTextSelectionTheme.darkTextSelectionTheme,
    inputDecorationTheme: BaatoInputDecorationTheme.darkInputDecorationTheme,
    chipTheme: BaatoChipTheme.darkChipTheme,
    listTileTheme: BaatoListTileTheme.darkListTileThemeData,
    scaffoldBackgroundColor: ThemeColor.black,
    appBarTheme: BaatoAppBarTheme.darkAppBarTheme,
    checkboxTheme: BaatoCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: BaatoBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BaatoElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BaatoOutlinedButtonTheme.darkOutlinedButtonTheme,
    iconTheme: BaatoIconTheme.darkIconTheme,
    iconButtonTheme: BaatoIconButtonTheme.darkIconButtonTheme,
    cardTheme: BaatoCardTheme.darkCardTheme,
    sliderTheme: BaatoSliderTheme.darkSliderTheme,
    searchBarTheme: BaatoSearchBarTheme.darkSearchBarTheme,
  );
}
