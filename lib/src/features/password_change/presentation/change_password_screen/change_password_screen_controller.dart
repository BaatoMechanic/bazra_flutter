import 'package:bato_mechanic/src/shared/repositories/user_repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "change_password_screen_controller.g.dart";

@riverpod
class ChangePasswordScreenController extends _$ChangePasswordScreenController {
  @override
  FutureOr<void> build() {}

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => ref
        .read(userRepositoryProvider)
        .changePassword(oldPassword, newPassword));

    return !state.hasError;
  }
}
