import 'package:bato_mechanic/src/common/widgets/async_value_widget.dart';
import 'package:bato_mechanic/src/features/repair_request/application/providers.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/vehicle_category/presentation/vehicle_category_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/helpers/utility_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants/managers/values_manager.dart';
import '../data/vehicle_category_repository.dart';

class VehicleCategoryScreen extends ConsumerWidget {
  const VehicleCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(vehicleCategoryScreenControllerProvider,
        (previous, state) => state.showError(context));

    final vehicleCategoriesValue = ref.watch(
        fetchVehicleCategoriesForServiceProvider(
            ref.watch(selectedServiceProvider)!.idx));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AsyncValueWidget(
          value: vehicleCategoriesValue,
          data: (vehicleCategories) => SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 180),
                  Text(
                    'Select your vehicle type',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: vehicleCategories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        ref
                            .read(vehicleCategoryScreenControllerProvider
                                .notifier)
                            .setSelectedCategory(vehicleCategories[index]);
                        context.pushNamed(APP_ROUTE.requestMechanic.name);
                      },
                      child: Card(
                        margin: const EdgeInsets.all(AppMargin.m8),
                        child: Padding(
                          padding: const EdgeInsets.all(AppMargin.m8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WidgetUtils.renderImage(
                                  vehicleCategories[index].image,
                                  width: 150,
                                ),
                                Flexible(
                                  child: Text(
                                    vehicleCategories[index].name.capitalize(),
                                    overflow: TextOverflow.visible,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(color: ThemeColor.dark),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
