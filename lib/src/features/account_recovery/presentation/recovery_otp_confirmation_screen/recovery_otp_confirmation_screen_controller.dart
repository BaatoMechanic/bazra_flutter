import 'package:bato_mechanic/src/features/account_recovery/data/account_recovery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "recovery_otp_confirmation_screen_controller.g.dart";

@riverpod
class RecoveryOtpConfirmationScreenController
    extends _$RecoveryOtpConfirmationScreenController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<bool> checkOtp(String code, String otpIdx) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(accountRecoveryRepositoryProvider)
        .checkRecoveryOtp(code, otpIdx));

    return !state.hasError;
  }
}
