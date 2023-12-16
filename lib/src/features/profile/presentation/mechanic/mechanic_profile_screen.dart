// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/presentation/screens/mechanic_reviews_list_screen/mechanic_reviews_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/int_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';

import '../../../reviews_and_rating/presentation/widgets/mechanic_review_widget.dart';
import 'mechanic_profile_screen_controller.dart';

class MechanicProfileScreen extends ConsumerWidget {
  const MechanicProfileScreen({
    required this.mechanicIdx,
  });

  final String mechanicIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(mechanicProfileScreenControllerProvider,
        (previous, state) => state.showError(context));

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final assignedMechanic = ref.watch(watchMechanicStateChangesProvider).value;

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
                if (assignedMechanic == null ||
                    assignedMechanic.idx != mechanicIdx)
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
                        APP_ROUTE.mechanicReviewsList.name,
                        extra: {"mechanicIdx": mechanicIdx},
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
                _getMechanicReviews(ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMechanicReviews(WidgetRef ref) {
    final reviewsValue =
        ref.watch(fetchMechanicReviewsProvider('4ebFHe3UfuBLr9WbEroijH'));
    return AsyncValueWidget(
        value: reviewsValue,
        data: (reviews) => SizedBox(
              height: AppHeight.h140,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: reviews.length,
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MechanicReviewWidget(
                        review: reviews[idx],
                      ),
                    );
                  }),
            ));
  }
}
