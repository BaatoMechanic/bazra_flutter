// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../utils/constants/managers/color_manager.dart';
// import '../../../utils/constants/managers/values_manager.dart';
// import '../../../utils/validators/validation.dart';

// class EmailField extends StatelessWidget {
//   EmailField({
//     Key? key,
//     this.title,
//     this.labelText,
//     this.hintText,
//     this.controller,
//     required this.focusNode,
//     this.initialValue,
//     this.nextFocusNode,
//     this.autovalidateMode = AutovalidateMode.always,
//     this.onSaved,
//   }) : super(key: key);

//   final String? title;
//   final String? labelText;
//   final String? hintText;
//   final TextEditingController? controller;
//   final FocusNode focusNode;
//   final FocusNode? nextFocusNode;
//   final String? initialValue;
//   final AutovalidateMode autovalidateMode;
//   final Function(String?)? onSaved;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           if (title != null)
//             Text(
//               title!,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//               ),
//             ),
//           const SizedBox(
//             height: 10,
//           ),
//           Platform.isIOS
//               ? CupertinoTextField(
//                   placeholder: labelText,
//                   controller: controller,
//                   focusNode: focusNode,
//                   textInputAction: nextFocusNode != null
//                       ? TextInputAction.done
//                       : TextInputAction.next,
//                   keyboardType: TextInputType.text,
//                   decoration: BoxDecoration(
//                     border: Border(
//                       top: BorderSide(
//                         color: ColorManager.primary,
//                         width: 1,
//                       ),
//                       right: BorderSide(
//                         color: ColorManager.primary,
//                         width: 1,
//                       ),
//                       bottom: BorderSide(
//                         color: ColorManager.primary,
//                         width: 1,
//                       ),
//                       left: BorderSide(
//                         color: ColorManager.primary,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                   onEditingComplete: () {
//                     if (nextFocusNode != null) {
//                       FocusScope.of(context).requestFocus(nextFocusNode);
//                     }
//                   },
//                 )
//               : TextFormField(
//                   focusNode: focusNode,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) => AppValidator.validateEmail(value),
//                   style: TextStyle().copyWith(color: ThemeColor.dark),
//                   textInputAction: nextFocusNode != null
//                       ? TextInputAction.done
//                       : TextInputAction.next,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     labelText: labelText,
//                     hintText: hintText,
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: AppPadding.p12,
//                       vertical: AppPadding.p0,
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black, width: 1.0),
//                     ),
//                     border: const OutlineInputBorder(),
//                     // labelStyle: const TextStyle(color: Colors.green),
//                   ),
//                   onFieldSubmitted: (_) {
//                     if (nextFocusNode != null) {
//                       FocusScope.of(context).requestFocus(nextFocusNode);
//                     }
//                   },
//                 ),
//         ],
//       ),
//     );
//   }
// }


import 'package:bato_mechanic/src/common/widgets/form_fields/base_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/validators/validation.dart';

class EmailField extends StatelessWidget {
  const EmailField({
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
      validator: validator ?? (value) => AppValidator.validateEmail(value),
      textInputType: TextInputType.emailAddress,
      onSaved: onSaved,
      onChanged: onChanged,
      textStyle: textStyle,
    );
  }
}
