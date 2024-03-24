import 'package:bato_mechanic/src/features/account_recovery/data/account_recovery_repository.dart';
import 'package:bato_mechanic/src/shared/repositories/user_repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers.dart';

part "user_id_confirmation_screen_controller.g.dart";

@riverpod
class UserIdConfirmationScreenController
    extends _$UserIdConfirmationScreenController {
  bool _mounted = true;

  @override
  FutureOr<String?> build() {
    ref.onDispose(() {
      _mounted = false;
    });

    // This holds the state of otp idx
    return null;
  }

  Future<bool> requestOtp(String userId, {String recoveryType = "uid"}) async {
    state = const AsyncLoading();
    var response;
    if (recoveryType == "password") {
      response = await AsyncValue.guard(() => ref
          .read(accountRecoveryRepositoryProvider)
          .requestAccountRecoveryOtpPassword(userId));
    } else {
      response = await AsyncValue.guard(() => ref
          .read(accountRecoveryRepositoryProvider)
          .requestAccountRecoveryOtpUid(userId));
    }
    if ((response as AsyncValue).hasError) {
      state = AsyncError(response.error!, StackTrace.current);
    } else {
      ref
          .read(verifyOtpIdxProvider.notifier)
          .setOtpIdx(response.value?["recovery"]["idx"]);
      if (_mounted) {
        state = AsyncData(response.value?["message"]);
      }
    }

    return !state.hasError;
  }
}
