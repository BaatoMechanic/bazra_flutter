import 'package:flutter/material.dart';

import '../../utils/constants/managers/color_manager.dart';
import '../../utils/constants/managers/values_manager.dart';
import 'base_form_field.dart';

// ignore: must_be_immutable
class OTPField extends StatelessWidget {
  OTPField({
    Key? key,
    this.title,
    this.labelText,
    this.hintText,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.nextFocusNode,
    this.autovalidateMode,
    this.textStyle,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.otpLength = 6,
  }) : super(key: key);

  final String? initialValue;
  final String? title;
  final String? labelText;
  final String? hintText;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final AutovalidateMode? autovalidateMode;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  String? Function(String?)? validator;

  final int otpLength;
  String enteredOtp = "";

  @override
  Widget build(BuildContext context) {
    List<FocusNode> focusNodes = [];
    for (int i = 0; i < otpLength; i++) {
      focusNodes.add(FocusNode());
    }

    return Row(
      children: [
        for (int i = 0; i < otpLength; i++)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BaseFormField(
                initialValue: initialValue,
                title: title,
                labelText: labelText,
                hintText: hintText,
                textAlign: TextAlign.center,
                focusNode: focusNodes[i],
                nextFocusNode: i < otpLength - 1 ? focusNodes[i + 1] : null,
                autovalidateMode: autovalidateMode,
                validator: validator ??
                    (value) {
                      return null;
                    },
                textInputType: TextInputType.number,
                onSaved: onSaved,
                onChanged: (value) {
                  if (value != null && enteredOtp.length >= otpLength) {
                    enteredOtp = value;
                    value = value.substring(0, otpLength);
                  }
                  if (i < otpLength - 1) {
                    FocusScope.of(context).requestFocus(focusNodes[i + 1]);
                  }
                  if (i == otpLength - 1) {
                    FocusScope.of(context).unfocus();
                  }
                },
                textStyle: textStyle ??
                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: AppSize.s22, color: ThemeColor.dark),
              ),
            ),
          ),
      ],
    );
  }
}
