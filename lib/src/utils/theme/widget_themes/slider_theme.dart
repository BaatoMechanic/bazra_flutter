import 'package:flutter/material.dart';

import '../../constants/managers/color_manager.dart';

class BaatoSliderTheme {
  BaatoSliderTheme._();

  static SliderThemeData lightSliderTheme = const SliderThemeData(
    thumbColor: ThemeColor.primary,
    activeTrackColor: ThemeColor.primary,
    inactiveTrackColor: ThemeColor.grey,
  );

  static SliderThemeData darkSliderTheme = const SliderThemeData(
    thumbColor: ThemeColor.primary,
    activeTrackColor: ThemeColor.primary,
    inactiveTrackColor: ThemeColor.darkGrey,
  );
}
