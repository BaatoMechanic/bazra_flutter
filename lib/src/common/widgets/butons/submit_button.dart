// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/constants/managers/font_manager.dart';
import 'package:bato_mechanic/src/utils/constants/managers/style_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/managers/color_manager.dart';
import '../../../utils/constants/managers/values_manager.dart';

class SubmitButton extends StatefulWidget {
  SubmitButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showSpinner = false,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  bool showSpinner;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = HelperFunctions.isDarkMode(context);
    return ElevatedButton(
      onPressed: !widget.showSpinner
          ? () {
              setState(() {
                widget.showSpinner = !widget.showSpinner;
              });
              Future.delayed(const Duration(seconds: 1)).then((_) {
                if (mounted) {
                  setState(() {
                    widget.showSpinner = !widget.showSpinner;
                  });
                }
              });
              widget.onPressed();
            }
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.showSpinner)
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
          if (widget.showSpinner)
            Row(
              children: [
                Text(
                  'Signing in'.hardcoded(),
                  style: getBoldStyle().copyWith(
                    fontSize: FontSize.s16,
                    color: isDarkTheme ? ThemeColor.white : ThemeColor.black,
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
    // return GestureDetector(
    //   onTap: !widget.showSpinner
    //       ? () {
    //           setState(() {
    //             widget.showSpinner = !widget.showSpinner;
    //           });
    //           Future.delayed(const Duration(seconds: 1)).then((_) {
    //             if (mounted) {
    //               setState(() {
    //                 widget.showSpinner = !widget.showSpinner;
    //               });
    //             }
    //           });
    //           widget.onPressed();
    //         }
    //       : null,
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     padding: const EdgeInsets.symmetric(vertical: AppHeight.h8),
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(Radius.circular(5)),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //             color: isDarkTheme ? ThemeColor.darkerGrey : ThemeColor.grey,
    //             offset: const Offset(2, 4),
    //             blurRadius: 5,
    //             spreadRadius: 2)
    //       ],
    //       color: widget.showSpinner ? ThemeColor.grey : null,
    //       gradient: widget.showSpinner
    //           ? null
    //           : LinearGradient(
    //               begin: Alignment.centerLeft,
    //               end: Alignment.centerRight,
    //               colors: [
    //                   Theme.of(context).primaryColor.withAlpha(200),
    //                   Theme.of(context).primaryColorDark.withAlpha(200),
    //                 ]),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         if (widget.showSpinner)
    //           Padding(
    //             padding: const EdgeInsets.only(right: AppPadding.p12),
    //             child: SizedBox(
    //               height: AppHeight.h20,
    //               width: AppHeight.h20,
    //               child: CircularProgressIndicator.adaptive(
    //                 strokeWidth: 3,
    //                 valueColor:
    //                     const AlwaysStoppedAnimation<Color>(ThemeColor.white),
    //                 backgroundColor: ColorManager.primary,
    //               ),
    //             ),
    //           ),
    //         if (widget.showSpinner)
    //           Row(
    //             children: [
    //               Text(
    //                 'Signing in'.hardcoded(),
    //                 style: getBoldStyle().copyWith(
    //                   fontSize: FontSize.s16,
    //                   color: isDarkTheme ? ThemeColor.white : ThemeColor.black,
    //                 ),
    //               ),
    //             ],
    //           )
    //         else
    //           Text(
    //             widget.label,
    //             style: getBoldStyle().copyWith(
    //               fontSize: FontSize.s16,
    //               color: isDarkTheme ? ThemeColor.white : ThemeColor.black,
    //             ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
