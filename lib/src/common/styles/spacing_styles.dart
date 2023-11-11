import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:flutter/material.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: DefaultManager.appBarHeight,
    left: DefaultManager.defaultSpace,
    right: DefaultManager.defaultSpace,
    bottom: DefaultManager.defaultSpace,
  );
}
