import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/managers/values_manager.dart';
import '../../application/vechicle_category_service.dart';

class VehiclesScreen extends ConsumerWidget {
  const VehiclesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory =
        ref.watch(vehicleCategoryServiceProvider).selectedVehicleCategory;
    final vehiclesValue =
        ref.watch(fetchVehiclesProvider(selectedCategory!.id.toString()));
    return Scaffold(
        body: AsyncValueWidget(
      value: vehiclesValue,
      data: (vehicles) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(
                'Select your vehicle to repair'.hardcoded(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: vehicles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    ref
                        .read(vehiclesScreenControllerProvider.notifier)
                        .setSelectedVehicle(vehicles[index]);
                    context.goNamed(APP_ROUTE.parts.name);
                  },
                  child: Card(
                    margin: const EdgeInsets.all(AppMargin.m8),
                    child: Padding(
                      padding: const EdgeInsets.all(AppMargin.m8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              vehicles[index].image,
                              width: AppWidth.h150,
                            ),
                            Flexible(
                              child: Text(
                                vehicles[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(color: ThemeColor.black),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
