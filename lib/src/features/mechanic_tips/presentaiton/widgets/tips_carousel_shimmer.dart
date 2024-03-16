import 'package:bato_mechanic/src/shared/widgets/shimmer_widget.dart';
import 'package:bato_mechanic/src/shared/utils/helpers/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/constants/managers/color_manager.dart';
import '../../../../shared/utils/constants/managers/values_manager.dart';

const String title = 'Best Mechanic Tips';

class TipsCarouselShimmer extends StatelessWidget {
  const TipsCarouselShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration().copyWith(
        color: ColorManager.primaryShade10,
        borderRadius: BorderRadius.circular(
          AppRadius.r12,
        ),
      ),
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerWidget.roundedRectangular(width: AppWidth.h100),
          const SizedBox(
            height: AppHeight.h20,
          ),
          Row(
            children: [
              Column(
                children: [
                  ShimmerWidget.roundedRectangular(
                    width: DeviceUtils.getScreenWidth(context) * 0.72,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                  ShimmerWidget.roundedRectangular(
                    width: DeviceUtils.getScreenWidth(context) * 0.72,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                  ShimmerWidget.roundedRectangular(
                    width: DeviceUtils.getScreenWidth(context) * 0.72,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
