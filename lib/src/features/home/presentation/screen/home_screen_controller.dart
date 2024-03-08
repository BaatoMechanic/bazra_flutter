import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/auth_service.dart';

class HomeScreenController extends StateNotifier<AsyncValue<void>> {
  HomeScreenController({
    required this.ref,
  }) : super(const AsyncData(null));

  Ref ref;

  // Future<bool> hasRepairRequest(String userId) async {
  //   await Future.delayed(Duration(seconds: 2));
  //   final response = await ref
  //       .read(repairRequestServiceProvider)
  //       .fetchUserRepairRequests(userId);

  //   return response;
  // }

  Future<bool> fetchUserRepairRequests() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() =>
        // ref.read(repairRequestRepositoryProvider).fetchUserRepairRequest());
        ref.read(repairRequestServiceProvider).fetchUserRepairRequest());
    return !state.hasError;
  }

  Future<bool> fetchUserInfo(String token) async {
    state = await AsyncValue.guard(
        () => ref.read(authServiceProvider).fetchCurrentUserInfo(token));
    return !state.hasError;
  }

  Future<bool> refreshToken(String refreshToken) async {
    state = await AsyncValue.guard(
        () => ref.read(authServiceProvider).refreshToken(refreshToken));
    return !state.hasError;
  }

  //// Future<List<ServiceType>> fetchAllServices() async {
  ////   state = await AsyncValue.guard(
  ////       () => ref.read(serviceTypeServiceProvider).fetchAllSerivceTypes());
//
  ////   return state.value as List<ServiceType>;
  //// }
//
  //// Future<List<MechanicTip>> fetchAllMechanicTips() async {
  ////   state = await AsyncValue.guard(
  ////       () => ref.read(mechanicTipsServiceProvider).fetchMechanicTips());
//
  ////   return state.value as List<MechanicTip>;
  //// }
}

final homeScreenControllerProvider =
    StateNotifierProvider<HomeScreenController, AsyncValue<void>>((ref) {
  return HomeScreenController(ref: ref);
});

//// final fetchAllMechanicTipsProvider = FutureProvider<List<MechanicTip>>((ref) {
////   final serviceProvider = ref.watch(homeScreenControllerProvider.notifier);
////   return serviceProvider.fetchAllMechanicTips();
//// });
