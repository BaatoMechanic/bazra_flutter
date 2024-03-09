import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/data/reviews_and_rating_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/widgets/reviews_and_rating_shimmer_widget.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/widgets/mechanic_review_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MechanicReviewsListScreen extends ConsumerWidget {
  const MechanicReviewsListScreen({
    Key? key,
    required this.mechanicIdx,
  }) : super(key: key);

  final String mechanicIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
