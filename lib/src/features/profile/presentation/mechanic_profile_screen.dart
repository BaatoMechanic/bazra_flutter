import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/mechanic_review_widget.dart';

class MechanicProfileScreen extends StatelessWidget {
  const MechanicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              AppHeight.h30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppHeight.h30,
                      child: Image.asset(
                        'assets/images/no-profile.png'.hardcoded(),
                        width: AppHeight.h50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppHeight.h30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Krishna Rimal',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Row(
                            children: [
                              for (var i = 0; i < 5; i++)
                                Icon(Icons.star,
                                    color: Theme.of(context).primaryColor),
                              Text(
                                '(180+ reviews)',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: Theme.of(context).primaryColor),
                              Text(
                                'Nepalgunj, Banke',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Repairs'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          '80+'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Reviews'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          '180+'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'XP'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          '5000'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Level'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          '5'.hardcoded(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    label: Text('Request Session'.hardcoded()),
                  ),
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                Text(
                  'About Krishna'.hardcoded(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                Text(
                  'This is about Krishna who is a trained and professional mechanic with more dthan 10 years of experience'
                      .hardcoded(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                Text(
                  'Skills'.hardcoded(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Engine',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p45),
                      child: Row(
                        children: [
                          for (var i = 0; i < 3; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Icon(
                                Icons.settings,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          for (var i = 0; i < 2; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wheel',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p45),
                      child: Row(
                        children: [
                          for (var i = 0; i < 2; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Icon(
                                Icons.settings,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          for (var i = 0; i < 3; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Body',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p45),
                      child: Row(
                        children: [
                          for (var i = 0; i < 1; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Icon(
                                Icons.settings,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          for (var i = 0; i < 4; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p4),
                              child: Icon(
                                Icons.settings_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews'.hardcoded(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    TextButton(
                      onPressed: () => context.pushNamed(
                        appRoute.mechanicReviewsList.name,
                        // queryParameters: {"mechanicId": "6"}
                        // extra: "6",
                        extra: {"mechanicId": "9"},
                      ),
                      child: Row(
                        children: [
                          Text(
                            'See all'.hardcoded(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: AppSize.s16,
                            color: isDarkTheme
                                ? ThemeColor.light
                                : ThemeColor.dark,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h30,
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.5,
                  height: AppHeight.h140,
                  child: ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, idx) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: MechanicReviewWidget(),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
