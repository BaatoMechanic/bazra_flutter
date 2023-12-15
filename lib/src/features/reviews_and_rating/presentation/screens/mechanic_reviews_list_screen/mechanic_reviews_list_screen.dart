// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/screens/mechanic_reviews_list_screen/mechanic_reviews_list_screen_controller.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/widgets/reviews_and_rating_shimmer_widget.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/widgets/mechanic_review_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/reviews_and_rating.dart';
import '../../../../profile/presentation/mechanic/mechanic_profile_screen_controller.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p20,
          ),
          child: AsyncValueWidget(
            loadingShimmer: const ReviewsAndRatingShimmerWidget(),
            value: reviewsValue,
            data: (reviews) => ListView.builder(
                shrinkWrap: true,
                itemCount: reviews.length,
                itemBuilder: (_, idx) {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: MechanicReviewWidget(
                      review: reviews[idx],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
