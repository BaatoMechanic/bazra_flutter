import 'package:bato_mechanic/src/features/core/application/mechanic_service.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:bato_mechanic/src/shared/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';

import '../../../reviews_and_rating/data/reviews_and_rating_repository.dart';
import '../../../reviews_and_rating/presentation/widgets/mechanic_review_widget.dart';
import 'mechanic_profile_screen_controller.dart';

class MechanicProfileScreen extends ConsumerWidget {
  const MechanicProfileScreen({
    super.key,
    required this.mechanicIdx,
  });

  final String mechanicIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(mechanicProfileScreenControllerProvider,
        (previous, state) => state.showError(context));

    final mechanicValue = ref.watch(fetchMechanicInfoProvider(mechanicIdx));

    return SafeArea(
      child: Scaffold(
        body: AsyncValueWidget(
          value: mechanicValue,
          data: (mechanic) => SingleChildScrollView(
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
                        child: mechanic.profilePic != null
                            ? Image.network(mechanic.profilePic!)
                            : Image.asset(
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
                              mechanic.name,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Row(
                              children: [
                                for (var i = 0; i < 5; i++)
                                  Icon(Icons.star,
                                      color: Theme.of(context).primaryColor),
                                Text(
                                  '(${mechanic.additionalAttributes['total_reviews'] ?? "0"} reviews)',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Theme.of(context).primaryColor),
                                Text(
                                  'Nepalgunj, Banke',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                            mechanic.additionalAttributes['total_repairs']
                                    ?.toString() ??
                                '0'.hardcoded(),
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
                            mechanic.additionalAttributes['total_reviews']
                                    ?.toString() ??
                                '0'.hardcoded(),
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
                  if (mechanicValue.value != null &&
                      mechanicValue.value!.idx != mechanicIdx)
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
                    '${"About".hardcoded()} ${mechanic.name}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: AppHeight.h8,
                  ),
                  Text(
                    mechanic.additionalAttributes['description']?.toString() ??
                        "No description".hardcoded(),
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
                              color: context.isDarkMode
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
                  _getMechanicReviews(ref, mechanicIdx),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMechanicReviews(WidgetRef ref, String mechanicIdx) {
    final reviewsValue = ref.watch(fetchMechanicReviewsProvider(mechanicIdx));
    return AsyncValueWidget(
        value: reviewsValue,
        data: (reviews) => SizedBox(
              height: AppHeight.h140,
              child: reviews.isEmpty
                  ? const Center(
                      child: Text(
                      'No reviews yet',
                    ))
                  : ListView.builder(
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
