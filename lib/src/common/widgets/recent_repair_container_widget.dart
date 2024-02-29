// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/foramtters/date_formatter.dart';

import '../../utils/constants/managers/values_manager.dart';

class RecentRepairContainerWidget extends StatelessWidget {
  const RecentRepairContainerWidget({
    Key? key,
    required this.repairRequest,
    required this.onPressed,
  }) : super(key: key);

  final VehicleRepairRequest repairRequest;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
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
                    repairRequest.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: ThemeColor.dark),
                  ),
                  const SizedBox(
                    height: AppHeight.h14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: ThemeColor.dark,
                      ),
                      Text(
                        repairRequest.location?["locationName"] ?? "Unknown",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ThemeColor.dark),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppHeight.h4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: ThemeColor.dark,
                      ),
                      Text(
                        // '18th November, 2022'.hardcoded(),
                        BaatoDateFormatter.humanizeDateTime(
                            repairRequest.createdAt),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ThemeColor.dark),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppHeight.h4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.car_repair,
                        color: ThemeColor.dark,
                      ),
                      Text(
                        'Audi S3 model'.hardcoded(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: ThemeColor.dark),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
