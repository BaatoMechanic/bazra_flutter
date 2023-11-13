// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/managers/color_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';
import '../../../utils/validators/validation.dart';

class BaseFormField extends StatelessWidget {
  BaseFormField({
    Key? key,
    this.title,
    this.labelText,
    this.hintText,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.nextFocusNode,
    this.autovalidateMode,
    required this.validator,
    this.textStyle,
    required this.textInputType,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final String? title;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? initialValue;
  final TextInputType textInputType;
  final AutovalidateMode? autovalidateMode;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?) validator;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Platform.isIOS
              ? CupertinoTextField(
                  placeholder: labelText,
                  controller: controller,
                  focusNode: focusNode,
                  textInputAction: nextFocusNode != null
                      ? TextInputAction.done
                      : TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                      left: BorderSide(
                        color: ColorManager.primary,
                        width: 1,
                      ),
                    ),
                  ),
                  onEditingComplete: () {
                    if (nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(nextFocusNode);
                    }
                  },
                )
              : TextFormField(
                  initialValue: initialValue,
                  focusNode: focusNode,
                  controller: controller,
                  autovalidateMode:
                      autovalidateMode ?? AutovalidateMode.onUserInteraction,
                  validator: (value) => validator(value),
                  style:
                      textStyle ?? TextStyle().copyWith(color: ThemeColor.dark),
                  textInputAction: nextFocusNode != null
                      ? TextInputAction.done
                      : TextInputAction.next,
                  keyboardType: textInputType,
                  decoration: InputDecoration().copyWith(
                    labelText: labelText,
                    hintText: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                      vertical: AppPadding.p0,
                    ),
                    // enabledBorder: const OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.black, width: 1.0),
                    // ),
                    // border: const OutlineInputBorder(),
                    // labelStyle: const TextStyle(color: Colors.green),
                  ),
                  onFieldSubmitted: (_) {
                    if (nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(nextFocusNode);
                    }
                  },
                  onChanged: onChanged ?? (value) {},
                  onSaved: onSaved ?? (value) {},
                ),
        ],
      ),
    );
  }
}
