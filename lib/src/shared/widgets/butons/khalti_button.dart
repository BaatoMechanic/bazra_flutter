import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/shared/widgets/butons/pay_button.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';

class KhaltiButton extends ConsumerWidget {
  const KhaltiButton({
    super.key,
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
