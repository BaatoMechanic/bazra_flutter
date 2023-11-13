import 'package:bato_mechanic/src/utils/constants/managers/color_manager.dart';
import 'package:flutter/material.dart';

import '../../constants/managers/default_manager.dart';
import '../../constants/managers/font_manager.dart';
import '../../constants/managers/values_manager.dart';

class BaatoInputDecorationTheme {
  BaatoInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ThemeColor.primary,
    suffixIconColor: ThemeColor.primary,
    fillColor: ColorManager.primaryTint60,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppPadding.p12,
      vertical: AppPadding.p0,
    ),
    labelStyle: const TextStyle()
        .copyWith(fontSize: FontSize.s16, color: ThemeColor.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: FontSize.s14, color: ThemeColor.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ThemeColor.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ThemeColor.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: BorderSide(
        width: 1,
        color: ColorManager.primaryTint60,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ThemeColor.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ThemeColor.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1.3, color: ThemeColor.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ThemeColor.primary,
    suffixIconColor: ThemeColor.primary,
    fillColor: ColorManager.primaryTint60,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppPadding.p12,
      vertical: AppPadding.p0,
    ),
    labelStyle: const TextStyle()
        .copyWith(fontSize: FontSize.s16, color: ThemeColor.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: FontSize.s14, color: ThemeColor.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: ThemeColor.darkerGrey),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ThemeColor.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: BorderSide(
        width: 1,
        color: ColorManager.primaryTint60,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ThemeColor.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: ThemeColor.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
      borderSide: const BorderSide(width: 1.3, color: ThemeColor.error),
    ),
  );

  // static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  //   errorMaxLines: 2,
  //   prefixIconColor: ThemeColor.darkGrey,
  //   suffixIconColor: ThemeColor.darkGrey,
  //   // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
  //   labelStyle: const TextStyle()
  //       .copyWith(fontSize: FontSize.s16, color: ThemeColor.white),
  //   hintStyle: const TextStyle()
  //       // .copyWith(fontSize: FontSize.s14, color: ThemeColor.white),
  //       .copyWith(fontSize: FontSize.s14, color: ThemeColor.error),
  //   floatingLabelStyle:
  //       const TextStyle().copyWith(color: ThemeColor.white.withOpacity(0.8)),
  //   border: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: ThemeColor.darkGrey),
  //   ),
  //   enabledBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: ThemeColor.darkGrey),
  //   ),
  //   focusedBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: ThemeColor.white),
  //   ),
  //   errorBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
  //     borderSide: const BorderSide(width: 1, color: ThemeColor.warning),
  //   ),
  //   focusedErrorBorder: const OutlineInputBorder().copyWith(
  //     borderRadius: BorderRadius.circular(DefaultManager.inputFieldRadius),
  //     borderSide: const BorderSide(width: 2, color: ThemeColor.warning),
  //   ),
  // );
}
