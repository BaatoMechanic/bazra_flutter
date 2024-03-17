import 'package:bato_mechanic/src/shared/repositories/user_repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../shared/application/user_service.dart';

part "edit_profile_screen_controller.g.dart";

@riverpod
class EditProfileScreenController extends _$EditProfileScreenController {
  @override
  FutureOr<void> build() {}

  Future<bool> updateProfile(Map<String, dynamic> data) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
        () => ref.read(userServiceProvider).updateUserProfile(data));

    return !state.hasError;
  }
}
