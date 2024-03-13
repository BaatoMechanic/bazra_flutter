import 'package:bato_mechanic/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/style_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';

import '../../../utils/constants/managers/color_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';

// ignore: must_be_immutable
class SubmitButton extends StatefulWidget {
  SubmitButton({
    Key? key,
    required this.label,
    this.spinnerText,
    this.showSpinner = true,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final String? spinnerText;
  final Function() onPressed;
  // wether to show spinner when is process is ongoing
  bool showSpinner;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });

              await widget.onPressed();
              setState(() {
                isLoading = false;
              });
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.showSpinner && isLoading)
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p12),
              child: SizedBox(
                height: AppHeight.h20,
                width: AppHeight.h20,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 3,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(ThemeColor.white),
                  backgroundColor: ColorManager.primary,
                ),
              ),
            ),
          if (widget.showSpinner && isLoading)
            Row(
              children: [
                Text(
                  widget.spinnerText ?? ''.hardcoded(),
                  style: getBoldStyle().copyWith(
                    fontSize: FontSize.s16,
                    color: context.isDarkMode
                        ? ThemeColor.white
                        : ThemeColor.black,
                  ),
                ),
              ],
            )
          else
            Text(
              widget.label,
              style: getBoldStyle().copyWith(
                fontSize: FontSize.s16,
                color: ThemeColor.black,
              ),
            ),
        ],
      ),
    );
  }
}
