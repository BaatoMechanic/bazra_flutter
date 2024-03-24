import 'package:bato_mechanic/src/features/account_recovery/data/account_recovery_repository.dart';
import 'package:bato_mechanic/src/features/account_recovery/providers.dart';
import 'package:bato_mechanic/src/shared/repositories/user_repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "recover_password_screen_controller.g.dart";

@riverpod
class RecoverPasswordScreenController
    extends _$RecoverPasswordScreenController {
  bool _mounted = true;
  @override
  FutureOr<String?> build() {
    ref.onDispose(() {
      _mounted = false;
    });
    return null;
  }

  Future<bool> changePassword(String newPassword) async {
    state = const AsyncLoading();

    var response = await AsyncValue.guard(() => ref
        .read(accountRecoveryRepositoryProvider)
        .changePassword(ref.read(verifyOtpIdxProvider) ?? "", newPassword));

    if (response.hasError) {
      state = AsyncError(response.error!, StackTrace.current);
    } else {
      if (_mounted) {
        state = AsyncData(response.value?["detail"]);
      }
    }

    return !state.hasError;
  }
}
