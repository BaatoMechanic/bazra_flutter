import 'package:bato_mechanic/src/common/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/managers/values_manager.dart';

class ServiceTypeButtonShimmerWidget extends ConsumerWidget {
  const ServiceTypeButtonShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        ShimmerWidget.roundedRectangular(
          width: AppWidth.h50,
          height: AppHeight.h50,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppRadius.r12),
            ),
          ),
        ),
        SizedBox(
          height: AppHeight.h4,
        ),
        ShimmerWidget.roundedRectangular(
          width: AppWidth.h40,
        )
      ],
    );
  }
}
