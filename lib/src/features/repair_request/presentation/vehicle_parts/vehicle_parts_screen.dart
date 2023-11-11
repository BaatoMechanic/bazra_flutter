import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/utils/constants/test_parts.dart';
import 'package:bato_mechanic/src/features/repair_request/application/vechicles_service.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_parts/vehicle_parts_screen_controller.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicles/vehicles_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

class VehiclePartsScreen extends ConsumerWidget {
  const VehiclePartsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVehicle = ref.watch(vehicleServiceProvider).selectedVehicle;
    final vehiclePartsValue =
        ref.watch(fetchVehiclePartsProvider(selectedVehicle!.id.toString()));
    return Scaffold(
        body: SingleChildScrollView(
      child: AsyncValueWidget(
        value: vehiclePartsValue,
        data: (vehicleParts) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: AppHeight.h200,
              ),
              Text(
                'Where is the problem being occured?',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: vehicleParts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // onTap: () => context.goNamed(appRoute.requestMechanic.name),
                    onTap: () {
                      ref
                          .read(vehiclePartsScreenControllerProvider.notifier)
                          .setSelectedPart(vehicleParts[index]);
                      context.goNamed(appRoute.requestMechanic.name);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(AppMargin.m8),
                      child: Padding(
                        padding: const EdgeInsets.all(AppMargin.m8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              vehicleParts[index].image,
                              width: AppWidth.h100,
                            ),
                            Text(
                              vehicleParts[index].name.capitalize(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: ThemeColor.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
