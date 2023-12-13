// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/shimmer/shimmer_widget.dart';
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

class ServiceTypeButtonShimmerWidget extends ConsumerWidget {
  ServiceTypeButtonShimmerWidget({
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
