import 'package:bato_mechanic/src/shared/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/constants/managers/color_manager.dart';
import '../utils/constants/managers/values_manager.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
      child: Shimmer.fromColors(
        baseColor: context.isDarkMode ? ThemeColor.darkGrey : ThemeColor.grey,
        highlightColor:
            context.isDarkMode ? ThemeColor.grey : ThemeColor.lightGrey,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: context.isDarkMode ? ThemeColor.grey : ThemeColor.lightGrey,
            shape: shapeBorder,
          ),
        ),
      ),
    );
  }
}
