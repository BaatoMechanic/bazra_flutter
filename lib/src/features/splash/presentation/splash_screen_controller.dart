import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/repair_request_repository/repair_request_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/application/auth_service.dart';

class SplashScreenController extends StateNotifier<AsyncValue<void>> {
  SplashScreenController({
    required this.ref,
  }) : super(AsyncValue.data(null));

  Ref ref;

  Future<bool> hasRepairRequest(String userId) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await ref
        .read(repairRequestServiceProvider)
        .fetchUserRepairRequests(userId);

    return response;
  }

  Future<bool> fetchUserInfo(String token) async {
    state = await AsyncValue.guard(
        () => ref.read(authServiceProvider).fetchUserInfo(token));
    return !state.hasError;
  }

  Future<bool> refreshToken(String refreshToken) async {
    state = await AsyncValue.guard(
        () => ref.read(authServiceProvider).refreshToken(refreshToken));
    return !state.hasError;
  }
}

final splashScreenControllerProvider =
    StateNotifierProvider<SplashScreenController, AsyncValue<void>>((ref) {
  return SplashScreenController(ref: ref);
});
