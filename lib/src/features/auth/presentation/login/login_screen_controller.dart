// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreenController extends StateNotifier<AsyncValue<void>> {
  LoginScreenController(
    this.ref,
  ) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<bool> signInWithIdAndPassword(String uId, String password) async {
    state = const AsyncValue.loading();
    if (mounted) {
      state = await AsyncValue.guard(() =>
          ref.read(authServiceProvider).signInWithIdAndPassword(uId, password));
    }
    return !state.hasError;
  }
}

final loginScreenControllerProvider =
    StateNotifierProvider.autoDispose<LoginScreenController, AsyncValue<void>>(
        (ref) {
  return LoginScreenController(ref);
});
