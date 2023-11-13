import 'package:bato_mechanic/src/common/domain/service_type.dart';

import 'package:flutter/material.dart';

import '../../utils/constants/managers/values_manager.dart';
import '../../utils/enums/service_type_options.dart';
import '../repair_request/domain/vehicle_part.dart';
import 'service_type_button.dart';

class ServiceButtonsGrid extends StatelessWidget {
  const ServiceButtonsGrid({
    super.key,
  });

  List<ServiceType> get services => [
        ServiceType(
            id: '1',
            name: 'Paint',
            type: ServiceTypeOption.PAINTING,
            icon: Icons.format_paint_outlined,
            partsIncluded: [
              VehiclePart(
                id: 1,
                name: "Frame",
                vehicleCategoryId: 1,
                image: 'assets/images/body.png',
                isMultiple: false,
              ),
            ]),
        ServiceType(
            id: '1',
            name: 'Wiring',
            type: ServiceTypeOption.ELECTRICAL_REPAIR,
            icon: Icons.wifi_rounded,
            partsIncluded: [
              VehiclePart(
                id: 1,
                name: "Body",
                vehicleCategoryId: 1,
                image: 'assets/images/body.png',
                isMultiple: false,
              ),
            ]),
        ServiceType(
            id: '1',
            name: 'Wheel Repair',
            icon: Icons.two_wheeler,
            type: ServiceTypeOption.WHEEL_REPAIR,
            partsIncluded: [
              VehiclePart(
                id: 1,
                name: "Body",
                vehicleCategoryId: 1,
                image: 'assets/images/wheel.png',
                isMultiple: false,
              ),
            ]),
        ServiceType(
            id: '1',
            name: 'Engine Repair',
            icon: Icons.engineering,
            type: ServiceTypeOption.ENGINE_REPAIR,
            partsIncluded: [
              VehiclePart(
                id: 1,
                name: "Engine",
                vehicleCategoryId: 1,
                image: 'assets/images/engine.png',
                isMultiple: false,
              ),
            ])
      ];

  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (ctx, idx) => ServiceTypeButton(
              serviceType: services[idx],
            ));
  }
}
