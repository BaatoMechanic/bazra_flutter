// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/common/widgets/inplace_carousel_widget.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/domain/mechanic_tip.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

const String title = 'Best Mechanic Tips';

// const List<Map<String, dynamic>> tipList = [
//   {
//     'tip':
//         "First Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
//     "mechanic_image": "assets/images/no-profile.png",
//   },
//   {
//     'tip':
//         "Second Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
//     "mechanic_image": "assets/images/no-profile.png",
//   },
// ];

class TipsCarousel extends StatelessWidget {
  const TipsCarousel({
    Key? key,
    required this.tips,
  }) : super(key: key);

  final List<MechanicTip> tips;

  @override
  Widget build(BuildContext context) {
    // final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final List<Widget> tipSliderItems = tips
        .map(
          (item) => Row(
            children: [
              Flexible(
                child: Text(
                  item.tip,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ThemeColor.black.withOpacity(0.5)),
                ),
              ),
              SizedBox(
                width: AppHeight.h75,
                child: item.mechanic['image'] != null
                    ? GestureDetector(
                        onTap: () => context.pushNamed(
                                APP_ROUTE.mechanicProfile.name,
                                extra: {
                                  'mechanicIdx': item.mechanic['idx'],
                                }),
                        child: Image.network(item.mechanic['image']))
                    : Image.asset(
                        "assets/images/no-profile.png",
                      ),
              ),
            ],
          ),
        )
        .toList();
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
          Text(
            'Best Mechanic Tips',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          InPlaceCarouselWidget(
            items: tipSliderItems,
            aspectRatio: 3.2.doubleHardcoded(),
          ),
        ],
      ),
    );
  }
}
