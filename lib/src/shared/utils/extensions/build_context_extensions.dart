import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
