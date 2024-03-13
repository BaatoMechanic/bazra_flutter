import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_screen_controller.g.dart';

@riverpod
class LoginScreenController extends _$LoginScreenController {
  bool _mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _mounted = false);
  }

  Future<bool> signInWithIdAndPassword(String uId, String password) async {
    state = const AsyncValue.loading();
    if (_mounted) {
      state = await AsyncValue.guard(() =>
          ref.read(authServiceProvider).signInWithIdAndPassword(uId, password));
    }
    return !state.hasError;
  }
}
