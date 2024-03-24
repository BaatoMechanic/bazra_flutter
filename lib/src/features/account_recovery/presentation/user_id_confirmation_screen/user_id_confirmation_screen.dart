// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/shared/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:bato_mechanic/src/features/account_recovery/presentation/user_id_confirmation_screen/user_id_confirmation_screen_controller.dart';
import 'package:bato_mechanic/src/features/account_recovery/providers.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/async_value_extensions.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/shared/utils/helpers/toast_helper.dart';
import 'package:bato_mechanic/src/shared/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/id_field.dart';
import 'package:bato_mechanic/src/shared/widgets/form_fields/password_field.dart';

class UserIdConfirmationScreen extends ConsumerStatefulWidget {
  const UserIdConfirmationScreen({
    super.key,
    this.recoveryType = "uid",
  });
  // Type can either be uid or password
  // If password then it will ask for old password
  // else it will ask for user id which can be either phone or email
  final String recoveryType;

  @override
  ConsumerState<UserIdConfirmationScreen> createState() =>
      _ConfirmOldPasswordScreenState();
}

class _ConfirmOldPasswordScreenState
    extends ConsumerState<UserIdConfirmationScreen> {
  final TextEditingController _uIdController =
      TextEditingController(text: "9808144809");
  final FocusNode _uIdFocusNode = FocusNode();

  final uidString = 'Please enter your mobile number'.hardcoded();
  final passwordString = 'Please enter your old password'.hardcoded();

  @override
  Widget build(BuildContext context) {
    ref.listen(userIdConfirmationScreenControllerProvider, (previous, state) {
      if (state.hasValue && state.value != null) {
        ToastHelper.showNotification(context, state.value!);
      }
      if (state.hasError) {
        state.showError(context);
      }
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.recoveryType == "uid" ? uidString : passwordString,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: AppHeight.h50,
            ),
            const SizedBox(height: 16.0),
            IdField(
              controller: _uIdController,
              focusNode: _uIdFocusNode,
              validator: (value) => widget.recoveryType == "uid"
                  ? AppValidator.validateId(value)
                  : AppValidator.validatePassword(value),
              hintText: widget.recoveryType == "uid"
                  ? "Email or number".hardcoded()
                  : "Old password".hardcoded(),
              labelText: widget.recoveryType == "uid"
                  ? "Email or number".hardcoded()
                  : "Old password".hardcoded(),
            ),
            const SizedBox(height: 16.0),
            SubmitButton(
              onPressed: () async {
                String uid = _uIdController.text;
                // ref
                //     .read(userIdentifierProvider.notifier)
                //     .setUserIdentifier(uid);

                if (widget.recoveryType == "password") {
                  if (await ref
                      .read(userIdConfirmationScreenControllerProvider.notifier)
                      .requestOtp(uid, recoveryType: "password")) {
                    context.pushNamed(
                      APP_ROUTE.confirmRecoveryOTP.name,
                    );
                  }
                } else {
                  if (await ref
                      .read(userIdConfirmationScreenControllerProvider.notifier)
                      .requestOtp(uid)) {
                    context.pushNamed(
                      APP_ROUTE.confirmRecoveryOTP.name,
                      // extra: {
                      // "route": APP_ROUTE.changePassword,
                      // }
                    );
                  }
                }
              },
              label: widget.recoveryType == "uid"
                  ? 'Verify ID'.hardcoded()
                  : "Verify Password".hardcoded(),
            ),
          ],
        ),
      ),
    );
  }
}
