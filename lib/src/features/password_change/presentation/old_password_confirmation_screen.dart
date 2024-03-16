import 'package:bato_mechanic/src/shared/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/password_field.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmOldPasswordScreen extends StatefulWidget {
  const ConfirmOldPasswordScreen({super.key});

  @override
  State<ConfirmOldPasswordScreen> createState() =>
      _ConfirmOldPasswordScreenState();
}

class _ConfirmOldPasswordScreenState extends State<ConfirmOldPasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();

  final FocusNode _oldPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please enter your old password'.hardcoded(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: AppHeight.h50,
            ),
            const SizedBox(height: 16.0),
            PasswordField(
              controller: _oldPasswordController,
              focusNode: _oldPasswordFocusNode,
              hintText: "Please enter your old password".hardcoded(),
              labelText: 'Old Password'.hardcoded(),
            ),
            const SizedBox(height: 16.0),
            SubmitButton(
              onPressed: () => context.pushNamed(APP_ROUTE.confirmOTP.name),
              label: 'Change Password'.hardcoded(),
            ),
          ],
        ),
      ),
    );
  }
}
