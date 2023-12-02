import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';

const String title = 'Best Mechanic Tips';

const List<Map<String, dynamic>> tipList = [
  {
    'tip':
        "First Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
    "mechanic_image": "assets/images/no-profile.png",
  },
  {
    'tip':
        "Second Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
    "mechanic_image": "assets/images/no-profile.png",
  },
];

class TipsCarousel extends StatelessWidget {
  const TipsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final List<Widget> tipSliderItems = tipList
        .map(
          (item) => Row(
            children: [
              Flexible(
                child: Text(
                  item['tip'],
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ThemeColor.black.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                width: AppHeight.h75,
                child: Image.asset(
                  item['mechanic_image'],
                ),
              ),
            ],
          ),
        )
        .toList();
    return Container(
      decoration: const BoxDecoration().copyWith(
        color: ColorManager.primaryShade10,
        // color: isDarkTheme ? ThemeColor.grey : ThemeColor.lightGrey,
        borderRadius: BorderRadius.circular(
          AppRadius.r12,
        ),
      ),
      padding: EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Mechanic Tips',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: AppHeight.h8,
          ),
          InPlaceCarouselWidget(
            items: tipSliderItems,
            aspectRatio: 4.5.doubleHardcoded(),
          ),
        ],
      ),
    );
  }
}
