// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/shimmer_widget.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

class ReviewsAndRatingShimmerWidget extends ConsumerWidget {
  const ReviewsAndRatingShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          // border: isDarkTheme
          //     ? Border.all(color: ThemeColor.darkContainer)
          //     : Border.all(color: ThemeColor.darkContainer),
          border: Border.all(color: ThemeColor.darkContainer),
          color:
              isDarkTheme ? ThemeColor.transparent : ColorManager.primaryTint60,
          borderRadius: BorderRadius.circular(AppRadius.r8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.circular(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppPadding.p4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerWidget.roundedRectangular(
                              width: AppWidth.h100),
                          ShimmerWidget.roundedRectangular(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ShimmerWidget.roundedRectangular(),
            ],
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          ShimmerWidget.roundedRectangular(
            width: HelperFunctions.screenWidth(context) * 0.7,
          ),
          ShimmerWidget.roundedRectangular(
            width: HelperFunctions.screenWidth(context) * 0.7,
          ),
          ShimmerWidget.roundedRectangular(
            width: HelperFunctions.screenWidth(context) * 0.7,
          ),
        ],
      ),
    );
  }
}
