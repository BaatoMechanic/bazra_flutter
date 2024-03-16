import 'package:bato_mechanic/src/shared/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../reviews_and_rating/data/reviews_and_rating_repository.dart';

class TempScr extends ConsumerWidget {
  const TempScr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsValue = ref.watch(fetchMechanicReviewsProvider("kj"));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature'),
      ),
      body: AsyncValueWidget(
        value: reviewsValue,
        data: (reviews) => Column(
          children: reviews.map((review) => Text(review.review)).toList(),
        ),
      ),
    );
  }
}
