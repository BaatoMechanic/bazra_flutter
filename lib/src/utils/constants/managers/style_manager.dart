import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight) {
  return const TextStyle().copyWith(
      fontSize: fontSize, fontFamily: fontFamily, fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular);
}
// light text style

TextStyle getLightStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light);
}
// bold text style

TextStyle getBoldStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold);
}

// semi bold text style

TextStyle getSemiBoldStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold);
}

// medium text style

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium);
}
