// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bato_mechanic/src/utils/validators/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/managers/color_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';

class IdField extends StatelessWidget {
  IdField({
    Key? key,
    this.title,
    this.labelText,
    this.hintText,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);
  final String? title;
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          const SizedBox(
            height: AppHeight.h4,
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
                    // else
                    // _userProvider.loginScreenSaveForm(
                    //     context, _form, mounted);
                  },
                  // onChanged: (value) {
                  //   if (isPassword) {
                  //     setState(() {
                  //       _userProvider.loginScreenUserpassword = value;
                  //     });
                  //   } else {
                  //     setState(() {
                  //       _userProvider.loginScreenUsernameOrEmail = value;
                  //     });
                  //   }
                  // },
                )
              : TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => AppValidator.validateEmail(value),

                  textInputAction: nextFocusNode != null
                      ? TextInputAction.done
                      : TextInputAction.next,
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration().copyWith(
                    labelText: labelText,
                    hintText: hintText,
                  ),
                  onFieldSubmitted: (_) {
                    if (nextFocusNode != null) {
                      FocusScope.of(context).requestFocus(nextFocusNode);
                    }
                    // else {
                    //   _userProvider.loginScreenSaveForm(
                    //       context, _form, mounted);
                    // }
                  },
                  // onSaved: (value) {
                  //   if (isPassword) {
                  //     _userProvider.loginScreenUserpassword = value;
                  //   } else {
                  //     _userProvider.loginScreenUsernameOrEmail = value;
                  //   }
                  // },
                ),
        ],
      ),
    );
  }
}
