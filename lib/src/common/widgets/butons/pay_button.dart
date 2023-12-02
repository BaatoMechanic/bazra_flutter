// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/managers/color_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';

class PayButton extends StatefulWidget {
  PayButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.shouldShowSpinner = false,
    this.buttonColor,
    this.textColor,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  bool shouldShowSpinner;
  bool showSpinner = false;
  final Color? buttonColor;
  final Color? textColor;

  @override
  State<PayButton> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
          onPressed: widget.showSpinner
              ? null
              : () async {
                  if (widget.shouldShowSpinner) {
                    setState(() {
                      widget.showSpinner = true;
                    });
                  }
                  await widget.onPressed();
                  if (widget.shouldShowSpinner) {
                    setState(() {
                      widget.showSpinner = false;
                    });
                  }
                },
          style: !widget.showSpinner
              ? Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    foregroundColor: MaterialStatePropertyAll(
                      widget.textColor,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        widget.buttonColor ?? ColorManager.primary),
                  )
              : ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryTint40,
                ),
          icon: widget.showSpinner
              ? const Center(
                  child: SizedBox(
                    height: AppHeight.h20,
                    width: AppHeight.h20,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
          label: Text(
            widget.label,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: widget.textColor ?? ThemeColor.dark,
                ),
          )),
    );
  }
}


// color: widget.showSpinner ? ColorManager.lightestGrey : null,