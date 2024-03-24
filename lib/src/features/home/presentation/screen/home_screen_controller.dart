import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/application/auth_service.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  FutureOr<void> build() {
    // pass
  }

  Future<bool> fetchUserActiveRequest() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() =>
        ref.read(repairRequestServiceProvider).fetchUserActiveRepairRequest());
    return !state.hasError;
  }

  Future<bool> fetchUserRepairRequests() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(repairRequestServiceProvider).fetchUserRepairRequests());
    return !state.hasError;
  }

  Future<bool> fetchUserInfo(String token) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(authServiceProvider).fetchCurrentUserInfo(token));
    return !state.hasError;
  }

  Future<bool> refreshToken(String refreshToken) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => ref.read(authServiceProvider).refreshToken(refreshToken));
    return !state.hasError;
  }
}
