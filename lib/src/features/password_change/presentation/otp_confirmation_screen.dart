// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/utils/enums/otp_type.dart';
import 'package:flutter/material.dart';

import 'package:bato_mechanic/src/common/widgets/form_fields/otp_field.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants/managers/color_manager.dart';

class OTPConfirmationScreen extends StatelessWidget {
  const OTPConfirmationScreen({
    Key? key,
    required this.otpType,
  }) : super(key: key);

  final OTPType otpType;

  _getOTPTitle() {
    switch (otpType) {
      case OTPType.EMAIL:
        return "email";
      case OTPType.PHONE:
        return "mobile number";
      default:
        return "email or phone";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter the OTP sent to your ${_getOTPTitle()}',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 16.0),
            OTPField(),
            const SizedBox(height: 32.0),
            SubmitButton(
              label: "Submit OTP",
              onPressed: () =>
                  context.replaceNamed(APP_ROUTE.changePassword.name),
            ),
            TextButton(
              onPressed: () {},
              style: const ButtonStyle().copyWith(),
              child: Text(
                'Resend OTP',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ThemeColor.primary,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
