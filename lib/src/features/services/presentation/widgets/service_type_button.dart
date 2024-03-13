import 'package:bato_mechanic/src/features/repair_request/application/providers.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/service/service.dart';
import '../../../../utils/constants/managers/color_manager.dart';
import '../../../../utils/constants/managers/values_manager.dart';

class ServiceTypeButtonWidget extends ConsumerWidget {
  const ServiceTypeButtonWidget({
    required this.serviceType,
    Key? key,
  }) : super(key: key);

  final Service serviceType;

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
                  .read(selectedServiceProvider.notifier)
                  .setSelectedService(serviceType);

              context.pushNamed(APP_ROUTE.categories.name);
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
