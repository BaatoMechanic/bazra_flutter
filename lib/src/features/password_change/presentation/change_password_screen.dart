import 'package:bato_mechanic/src/common/widgets/form_fields/password_field.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

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
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
