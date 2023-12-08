// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/common/widgets/mechanic_review_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/domain/reviews_and_rating.dart';
import '../../profile/presentation/mechanic/mechanic_profile_screen_controller.dart';

class MechanicReviewsListScreen extends ConsumerWidget {
  const MechanicReviewsListScreen({
    Key? key,
    required this.mechanicIdx,
  }) : super(key: key);

  final String mechanicIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(mechanicProfileScreenControllerProvider,
    //     (previous, state) => state.showError(context));

    final reviewsValue = ref.watch(fetchMechanicReviewsProvider(mechanicIdx));

    return SafeArea(
      child: Scaffold(
        body: AsyncValueWidget(
          value: reviewsValue,
          data: (reviews) => ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (_, idx) {
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: MechanicReviewWidget(
                    review: reviews[idx],
                    // review: ReviewAndRating(
                    //   idx: "dkfj",
                    //   review: 'review',
                    //   rating: 5.0,
                    //   reviewerIdx: 'reviewer',
                    //   reviewedIdx: 'reviewed',
                    //   createdAt: DateTime.now(),
                    // ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
