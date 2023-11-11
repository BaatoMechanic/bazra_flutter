import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/managers/values_manager.dart';

class RecentRepairContainerWidget extends StatelessWidget {
  const RecentRepairContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r8),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Stack(
          children: [
            Positioned(
              // bottom: AppHeight.h0,
              bottom: -15.0.doubleHardcoded(),
              // right: AppHeight.h0,
              right: -75.0.doubleHardcoded(),
              child: Image.asset(
                'assets/images/vehicle/car.png', // Replace with your image path
                // fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Replace worn out tires".hardcoded(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: AppHeight.h14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text(
                      'Sauraha, Chitwan'.hardcoded(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    Text(
                      '18th November, 2022'.hardcoded(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: AppHeight.h4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.car_repair),
                    Text(
                      'Audi S3 model'.hardcoded(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
