import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/common/widgets/butons/pay_button.dart';
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';

class EsewaButton extends ConsumerWidget {
  const EsewaButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PayButton(
      label: 'Pay with e-Sewa',
      buttonColor: ThirdPartyColor.esewaColor,
      shouldShowSpinner: true,
      onPressed: onPressed ?? () {},
    );
  }
}
