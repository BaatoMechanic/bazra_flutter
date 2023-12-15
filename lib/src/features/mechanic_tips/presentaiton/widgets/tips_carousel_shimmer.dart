// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/shimmer_widget.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/domain/mechanic_tip.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

const String title = 'Best Mechanic Tips';

class TipsCarouselShimmer extends StatelessWidget {
  const TipsCarouselShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

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
                    width: HelperFunctions.screenWidth(context) * 0.72,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                  ShimmerWidget.roundedRectangular(
                    width: HelperFunctions.screenWidth(context) * 0.72,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                  ShimmerWidget.roundedRectangular(
                    width: HelperFunctions.screenWidth(context) * 0.72,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                ],
              ),

              // SizedBox(
              //     width: AppHeight.h75,
              //     child: ShimmerWidget.roundedRectangular()),
            ],
          ),
        ],
      ),
    );
  }
}
