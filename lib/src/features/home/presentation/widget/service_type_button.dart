// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/repair_request/application/vehicle_parts_service.dart';
import 'package:bato_mechanic/src/features/repair_request/presentation/vehicle_categories/vehicle_category_screen.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/features/mechanic_tips/presentaiton/widgets/tips_carousel.dart';
import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../repair_request/domain/service_type.dart';
import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';
import '../../../repair_request/application/service_type_service.dart';

class ServiceTypeButtonWidget extends ConsumerWidget {
  ServiceTypeButtonWidget({
    required this.serviceType,
    Key? key,
  }) : super(key: key);

  ServiceType serviceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeColor.primary,
            borderRadius: BorderRadius.circular(DefaultManager.cardRadiusXs),
          ),
          child: IconButton(
            onPressed: () {
              ref
                  .read(serviceTypeServiceProvider)
                  .setSelectedServiceType(serviceType);
              context.pushNamed(appRoute.categories.name);
            },
            icon: Icon(serviceType.icon ?? Icons.hourglass_empty),
          ),
        ),
        const SizedBox(
          height: AppHeight.h4,
        ),
        Text(
          serviceType.name,
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
          softWrap: true,
        )
      ],
    );
  }
}
