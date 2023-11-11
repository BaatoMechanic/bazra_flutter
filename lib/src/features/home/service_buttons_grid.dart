import 'package:flutter/material.dart';

import '../../utils/constants/managers/values_manager.dart';
import 'service_type_button.dart';

class ServiceButtonsGrid extends StatelessWidget {
  const ServiceButtonsGrid({
    super.key,
  });

  List<Map<String, dynamic>> get serviceTypes => [
        {
          "name": "Paint",
          "icon": Icon(
            Icons.format_paint_outlined,
          ),
        },
        {
          "name": "Wheel",
          "icon": Icon(
            Icons.wheelchair_pickup_outlined,
          ),
        },
        {
          "name": "Engine",
          "icon": Icon(
            Icons.car_crash,
          ),
        },
        {
          "name": "Wiring",
          "icon": Icon(
            Icons.electric_bolt_rounded,
          ),
        }
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
          // crossAxisSpacing: AppHeight.h4,
        ),
        itemCount: serviceTypes.length,
        itemBuilder: (ctx, idx) => ServiceTypeButton(
              name: serviceTypes[idx]['name'],
              icon: serviceTypes[idx]['icon'],
            ));
  }
}
