// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/common/widgets/rating_stars_widget.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/widgets/reviews_and_rating_shimmer_widget.dart';
import 'package:bato_mechanic/src/utils/extensions/datetime_extensions.dart';
import 'package:bato_mechanic/src/utils/foramtters/date_formatter.dart';
import 'package:bato_mechanic/src/utils/helpers/user_helper.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/features/profile/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

class MechanicReviewWidget extends ConsumerWidget {
  const MechanicReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  final ReviewAndRating review;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final reviewerInfoValue =
        ref.watch(fetchUserInfoProvider(review.reviewerIdx));
    return AsyncValueWidget(
      loadingShimmer: const ReviewsAndRatingShimmerWidget(),
      value: reviewerInfoValue,
      data: (reviewer) => Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
            // border: isDarkTheme
            //     ? Border.all(color: ThemeColor.lightGrey)
            //     : Border.all(color: ThemeColor.grey),
            border: Border.all(color: ThemeColor.darkContainer),
            color: isDarkTheme
                ? ThemeColor.transparent
                : ColorManager.primaryTint60,
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
                      CircleAvatar(
                        radius: AppHeight.h20,
                        child: reviewer?.profilePic != null
                            ? Image.network(reviewer!.profilePic!)
                            : Image.asset(
                                'assets/images/no-profile.png',
                                width: 30.0.doubleHardcoded(),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              UserHelperFunctions.getUserName(reviewer?.name),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            RatingStarsWidget(rating: review.rating),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Text('2 days ago'.hardcoded()),
                Text(review.createdAt.toAgo()),
              ],
            ),
            const SizedBox(
              height: AppHeight.h8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                // 'Hello This is about Krishna who is a trained and professional mechanic with more dthan 10 years of experience',
                review.review,
                style: !isDarkTheme
                    ? Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: ThemeColor.dark)
                    : Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
