// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/auth/application/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreenController extends StateNotifier<AsyncValue<void>> {
  SignUpScreenController(
    this.ref,
  ) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<bool> createUserWithIdAndPassword(String uId, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref
        .read(authServiceProvider)
        .createUserWithIdAndPassword(uId, password));
    return !state.hasError;
  }
}

final signupScreenControllerProvider =
    StateNotifierProvider.autoDispose<SignUpScreenController, AsyncValue<void>>(
        (ref) {
  return SignUpScreenController(ref);
});
