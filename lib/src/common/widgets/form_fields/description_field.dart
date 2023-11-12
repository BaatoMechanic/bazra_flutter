// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    Key? key,
    required this.textController,
    required this.focusNode,
    this.hintText,
  }) : super(key: key);

  final TextEditingController textController;
  final FocusNode focusNode;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      style: TextStyle().copyWith(color: ThemeColor.dark),
      decoration: InputDecoration().copyWith(
        hintText: hintText ?? '',
        border: OutlineInputBorder(),
      ),
      maxLines: 5,
    );
  }
}
