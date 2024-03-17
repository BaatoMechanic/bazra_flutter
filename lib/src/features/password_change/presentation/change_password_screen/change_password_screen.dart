import 'package:bato_mechanic/src/features/password_change/presentation/change_password_screen/change_password_screen_controller.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/shared/utils/helpers/toast_helper.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/password_field.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({required this.oldPassword, super.key});

  final String oldPassword;

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  String? _validateConfirmPassword(String? value) {
    if (_newPasswordController.text != value) {
      return "Password does not match";
    }
    return null;
  }

  bool checkPassword() {
    if (_newPasswordController.text == _confirmPasswordController.text) {
      return true;
    }
    return false;
  }

  _changePassword() async {
    if (_formKey.currentState!.validate()) {
      if (checkPassword()) {
        if (await ref
            .read(changePasswordScreenControllerProvider.notifier)
            .changePassword(widget.oldPassword, _newPasswordController.text)) {
          context.goNamed(APP_ROUTE.login.name);
          ToastHelper.showNotification(context, "Password changed");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(changePasswordScreenControllerProvider, (previousState, state) {
      state.showError(context);
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter new password',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppHeight.h12,
              ),
              Text(
                'New password must be different from previously used password',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: AppHeight.h50,
              ),
              const SizedBox(height: 16.0),
              PasswordField(
                controller: _newPasswordController,
                focusNode: _newPasswordFocusNode,
                labelText: 'New Password',
              ),
              const SizedBox(height: 16.0),
              PasswordField(
                controller: _confirmPasswordController,
                labelText: 'Confirm New Password',
                focusNode: _confirmPasswordFocusNode,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 32.0),
              // ElevatedButton(
              //   onPressed: () => _changePassword(),
              //   child: const Text('Change Password'),
              // ),
              SubmitButton(
                label: 'Change Password'.hardcoded(),
                onPressed: _changePassword,
              )
            ],
          ),
        ),
      ),
    );
  }
}
