import 'package:bato_mechanic/src/common/widgets/butons/facebook_button.dart';
import 'package:bato_mechanic/src/common/widgets/butons/google_button.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/email_field.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/divider_field.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/id_field.dart';
import 'package:bato_mechanic/src/utils/constants/managers/default_manager.dart';
import 'package:bato_mechanic/src/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:bato_mechanic/src/features/core/application/user_service.dart';
import 'package:bato_mechanic/src/features/auth/presentation/login/login_screen_controller.dart';
import 'package:bato_mechanic/src/features/auth/presentation/login_signup_label.dart';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/common/widgets/form_fields/password_field.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/utils/helpers/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  _login(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState!.validate()) {
      // pop the soft keyboard
      FocusScope.of(context).unfocus();
      final response = await ref
          .read(loginScreenControllerProvider.notifier)
          .signInWithIdAndPassword(
              _idController.text, _passwordController.text);
      if (response) {
        // context.goNamed(appRoute.home.name);
        context.goNamed(appRoute.trackMechanic.name);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(loginScreenControllerProvider,
        (previous, state) => state.showError(context));

    String name = "Krishna";
    final user = ref.watch(watchUserStateChangesProvider).value;
    final state = ref.watch(loginScreenControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: user != null ? Text('Hello, ${user.name}'.hardcoded()) : null,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IdField(
                      title: 'Id'.hardcoded(),
                      labelText: "Phone/email".hardcoded(),
                      hintText: "Enter your number or your valid email address"
                          .hardcoded(),
                      controller: _idController,
                      focusNode: _emailFocusNode,
                    ),
                    const SizedBox(
                      height: DefaultManager.defaultSpace,
                    ),
                    PasswordField(
                      title: "Password".hardcoded(),
                      labelText: "Password".hardcoded(),
                      hintText: "Enter your password".hardcoded(),
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                    ),
                    const SizedBox(
                      height: AppHeight.h30,
                    ),
                    SubmitButton(
                      showSpinner: state.isLoading,
                      label: 'Login'.hardcoded(),
                      onPressed: () => _login(context, ref),
                    ),
                    DividerField(
                      text: 'Or'.hardcoded(),
                    ),
                    GoogleButton(
                        labelText: "Sign in with Google".hardcoded(),
                        onPressed: () {}),
                    FacebookButton(
                        labelText: 'Log in with Facebook'.hardcoded(),
                        onPressed: () {}),
                    LoginSignUpLabel(
                      infoText: 'Don\'t have an account ?'.hardcoded(),
                      labelText: 'Register'.hardcoded(),
                      onPressed: () => context.goNamed(appRoute.signup.name),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
