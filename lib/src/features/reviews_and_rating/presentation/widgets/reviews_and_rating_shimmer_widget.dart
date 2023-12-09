// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/rating_stars_widget.dart';
import 'package:bato_mechanic/src/common/widgets/shimmer/shimmer_widget.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/utils/extensions/datetime_extensions.dart';
import 'package:bato_mechanic/src/utils/foramtters/date_formatter.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:bato_mechanic/src/utils/helpers/user_helper.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/features/profile/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShimmerWidget.circular(),
                    Padding(
                      padding: const EdgeInsets.only(
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
              ShimmerWidget.roundedRectangular(),
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
