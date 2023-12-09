import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/managers/color_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';
import '../../../utils/helpers/helper_functions.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.roundedRectangular({
    super.key,
    this.width = AppWidth.h75,
    this.height = AppHeight.h12,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppRadius.r2),
      ),
    ),
  });

  const ShimmerWidget.circular({
    super.key,
    this.width = AppWidth.h30,
    this.height = AppHeight.h30,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
      child: Shimmer.fromColors(
        // baseColor: Colors.grey[400]!,
        // highlightColor: Colors.grey[300]!,

        baseColor: isDarkTheme ? ThemeColor.darkGrey : ThemeColor.grey,
        highlightColor: isDarkTheme ? ThemeColor.grey : ThemeColor.lightGrey,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            // color: Colors.grey[300]!,
            color: isDarkTheme ? ThemeColor.grey : ThemeColor.lightGrey,
            shape: shapeBorder,
          ),
        ),
      ),
    );
  }
}
