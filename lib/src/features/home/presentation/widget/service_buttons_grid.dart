import 'package:bato_mechanic/src/features/services/domain/service_type.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/values_manager.dart';
import '../../../services/presentation/widgets/service_type_button.dart';

class ServiceButtonsGridWidget extends ConsumerWidget {
  ServiceButtonsGridWidget({
    super.key,
    required this.services,
  });

  List<Service> services;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: AppMargin.m12,
          mainAxisSpacing: AppMargin.m8,
        ),
        itemCount: services.length,
        itemBuilder: (ctx, idx) =>
            ServiceTypeButtonWidget(serviceType: services[idx]));
  }
}
