// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:bato_mechanic/src/common/widgets/butons/pay_button.dart';
import 'package:bato_mechanic/src/features/payment/application/payment_service.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';

class KhaltiButton extends ConsumerWidget {
  const KhaltiButton({
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PayButton(
      label: 'Pay with Kahlti',
      shouldShowSpinner: true,
      buttonColor: ThirdPartyColor.khaltiColor,
      onPressed: onPressed ?? () {},
    );
  }
}
