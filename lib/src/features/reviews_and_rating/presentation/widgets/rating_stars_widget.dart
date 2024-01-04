// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../utils/constants/managers/values_manager.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars).ceil();
    int emptyStars = 5 - fullStars - halfStars;

    return Row(children: [
      for (var i = 0; i < fullStars; i++)
        Icon(Icons.star,
            size: AppSize.s16, color: Theme.of(context).primaryColor),
      for (var i = 0; i < halfStars; i++)
        Icon(Icons.star_half,
            size: AppSize.s16, color: Theme.of(context).primaryColor),
      for (var i = 0; i < emptyStars; i++)
        Icon(Icons.star_outline,
            size: AppSize.s16, color: Theme.of(context).primaryColor),
    ]);
  }
}
