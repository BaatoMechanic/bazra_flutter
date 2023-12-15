import 'package:bato_mechanic/src/features/mechanic_tips/applicatoin/mechanic_tips_service.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/domain/mechanic_tip.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/application/service_type_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/repair_request_repository/repair_request_repository.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/service_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/auth_service.dart';

class HomeScreenController extends StateNotifier<AsyncValue<void>> {
  HomeScreenController({
    required this.ref,
  }) : super(AsyncData(null));

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
    state = await AsyncValue.guard(
        () => ref.read(repairRequestServiceProvider).fetchUserRepairRequests());
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

  Future<List<ServiceType>> fetchAllServices() async {
    state = await AsyncValue.guard(
        () => ref.read(serviceTypeServiceProvider).fetchAllSerivceTypes());

    return state.value as List<ServiceType>;
  }

  Future<List<MechanicTip>> fetchAllMechanicTips() async {
    state = await AsyncValue.guard(
        () => ref.read(mechanicTipsServiceProvider).fetchMechanicTips());

    return state.value as List<MechanicTip>;
  }
}

final homeScreenControllerProvider =
    StateNotifierProvider<HomeScreenController, AsyncValue<void>>((ref) {
  return HomeScreenController(ref: ref);
});

final fetchAllServiceTypeProvider = FutureProvider<List<ServiceType>>((ref) {
  final serviceProvider = ref.watch(homeScreenControllerProvider.notifier);
  // return ref.watch(serviceTypeServiceProvider).fetchAllSerivceTypes();
  return serviceProvider.fetchAllServices();
});

final fetchAllMechanicTipsProvider = FutureProvider<List<MechanicTip>>((ref) {
  final serviceProvider = ref.watch(homeScreenControllerProvider.notifier);
  return serviceProvider.fetchAllMechanicTips();
});
