import 'package:flutter/material.dart';

class ColorManager {
// Light Theme Colors
  static Color primary = HexColor.fromHex("#ffd740");
  static Color primaryTint10 = HexColor.fromHex("#ffdb53");
  static Color primaryTint20 = HexColor.fromHex("#ffdf66");
  static Color primaryTint30 = HexColor.fromHex("#ffe379");
  static Color primaryTint40 = HexColor.fromHex("#ffe78c");
  static Color primaryTint50 = HexColor.fromHex("#ffeba0");
  static Color primaryTint60 = HexColor.fromHex("#ffefb3");
  static Color primaryTint70 = HexColor.fromHex("#fff3c6");
  static Color primaryTint80 = HexColor.fromHex("#fff7d9");
  static Color primaryTint90 = HexColor.fromHex("#fffbec");
  static Color primaryTint100 = HexColor.fromHex("#ffffff");

  // Dark Theme Colors
  static Color primaryShade10 = HexColor.fromHex("#e6c23a");
  static Color primaryShade20 = HexColor.fromHex("#ccac33");
  static Color primaryShade30 = HexColor.fromHex("#b3972d");
  static Color primaryShade40 = HexColor.fromHex("#998126");
  static Color primaryShade50 = HexColor.fromHex("#806c20");
  static Color primaryShade60 = HexColor.fromHex("#66561a");
  static Color primaryShade70 = HexColor.fromHex("#4c4013");
  static Color primaryShade80 = HexColor.fromHex("#332b0d");
  static Color primaryShade90 = HexColor.fromHex("#191506");
  static Color primaryShade100 = HexColor.fromHex("#000000");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

class ThemeColor {
  // Theme Colors

  static const Color primary = Color(0xFFffd740);
  static const Color secondary = Colors.black87;
  static const Color accent = Colors.white70;

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  // static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderPrimary = Color(0xFFffd740);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // Additional colors
  static const Color transparent = Colors.transparent;
}

class ThirdPartyColor {
  // Third party Colors
  static Color khaltiColor = Colors.purple[900] as Color;
  static Color esewaColor = Colors.green[800] as Color;
}
