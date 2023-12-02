// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

import 'base_form_field.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
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
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return BaseFormField(
      initialValue: initialValue,
      title: title,
      labelText: labelText,
      hintText: hintText,
      maxLines: 4,
      controller: controller,
      focusNode: focusNode,
      nextFocusNode: nextFocusNode,
      autovalidateMode: autovalidateMode,
      validator: validator ?? (value) {},
      textInputType: TextInputType.text,
      onSaved: onSaved,
      onChanged: onChanged,
      textStyle: textStyle,
    );
  }
}
