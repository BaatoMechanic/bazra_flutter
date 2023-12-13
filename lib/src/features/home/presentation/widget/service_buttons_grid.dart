import 'package:bato_mechanic/src/features/repair_request/domain/service_type.dart';
import 'package:bato_mechanic/src/utils/constants/test_service_types.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/values_manager.dart';
import '../../../../utils/enums/service_type_options.dart';
import '../../../repair_request/domain/vehicle_part.dart';
import 'service_type_button.dart';

class ServiceButtonsGridWidget extends ConsumerWidget {
  ServiceButtonsGridWidget({
    super.key,
    required this.services,
  });

  List<ServiceType> services;

  // List<ServiceType> get services => mTestServiceTypes;

  // List<ServiceType> get services => [
  //       ServiceType(
  //           idx: '1',
  //           name: 'Paint',
  //           type: ServiceTypeOption.PAINTING,
  //           icon: Icons.format_paint_outlined,
  //           partsIncluded: [
  //             VehiclePart(
  //               idx: 1,
  //               name: "Frame",
  //               vehicleCategoryId: 1,
  //               image: 'assets/images/body.png',
  //               isMultiple: false,
  //             ),
  //           ]),
  //       ServiceType(
  //           idx: '1',
  //           name: 'Wiring',
  //           type: ServiceTypeOption.ELECTRICAL_REPAIR,
  //           icon: Icons.wifi_rounded,
  //           partsIncluded: [
  //             VehiclePart(
  //               idx: 1,
  //               name: "Body",
  //               vehicleCategoryId: 1,
  //               image: 'assets/images/body.png',
  //               isMultiple: false,
  //             ),
  //           ]),
  //       ServiceType(
  //           idx: '1',
  //           name: 'Wheel Repair',
  //           icon: Icons.two_wheeler,
  //           type: ServiceTypeOption.WHEEL_REPAIR,
  //           partsIncluded: [
  //             VehiclePart(
  //               idx: 1,
  //               name: "Body",
  //               vehicleCategoryId: 1,
  //               image: 'assets/images/wheel.png',
  //               isMultiple: false,
  //             ),
  //           ]),
  //       ServiceType(
  //           idx: '1',
  //           name: 'Engine Repair',
  //           icon: Icons.engineering,
  //           type: ServiceTypeOption.ENGINE_REPAIR,
  //           partsIncluded: [
  //             VehiclePart(
  //               idx: 1,
  //               name: "Engine",
  //               vehicleCategoryId: 1,
  //               image: 'assets/images/engine.png',
  //               isMultiple: false,
  //             ),
  //           ])
  //     ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: services.length,
        // itemBuilder: (ctx, idx) => ServiceTypeButton(
        //       name: services[idx].name,
        //       type: services[idx].type,
        //       icon: services[idx].icon,
        //     ));
        itemBuilder: (ctx, idx) => ServiceTypeButtonWidget(
              serviceType: services[idx],
            ));
  }
}
