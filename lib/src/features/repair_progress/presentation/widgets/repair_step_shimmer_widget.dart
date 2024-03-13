import 'package:bato_mechanic/src/common/widgets/shimmer_widget.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/helpers/device_utility.dart';
import 'package:flutter/material.dart';

class RepairStepShimmerWidget extends StatelessWidget {
  const RepairStepShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppMargin.m8,
        vertical: AppHeight.h12,
      ),
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadius.r8),
          ),
        ),
      ),
      width: DeviceUtils.getScreenWidth(context),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.roundedRectangular(
            width: AppWidth.h100,
          ),
          SizedBox(
            height: AppHeight.h8,
          ),
          ShimmerWidget.roundedRectangular(
            width: AppWidth.h200,
          ),
          ShimmerWidget.roundedRectangular(
            width: AppWidth.h200,
          ),
        ],
      ),
    );
  }
}
