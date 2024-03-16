import 'package:bato_mechanic/src/shared/widgets/form_fields/base_form_field.dart';
import 'package:bato_mechanic/src/shared/utils/validators/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IdField extends StatelessWidget {
  const IdField({
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
      controller: controller,
      focusNode: focusNode,
      nextFocusNode: nextFocusNode,
      autovalidateMode: autovalidateMode,
      validator: validator ?? (value) => AppValidator.validateId(value),
      textInputType: TextInputType.text,
      onSaved: onSaved,
      onChanged: onChanged,
      textStyle: textStyle,
    );
  }
}
