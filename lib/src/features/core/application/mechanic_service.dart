// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/auth/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/core/data/user_repository/user_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import "package:latlong2/latlong.dart";
import '../../auth/domain/user.dart';
import '../data/map_repository/map_repository.dart';
import '../data/mechanic_repository/mechanic_repository.dart';

final assignedMechanicProvider = StateProvider<User?>((ref) => null);

class MechanicService {
  MechanicService({
    required this.ref,
  });

  final _mechanicState = InMemoryStore<User?>(null);
  final Ref ref;

  // Future<List<User>> fetchRecommendedMechanics(
  //     String vehicleCategoryId, String vehiclePartId) async {
  //   final response = await ref
  //       .watch(userRepositoryProvider)
  //       .fetchRecommendedMechanics(vehicleCategoryId, vehiclePartId);

  //   if (response is Success) {
  //     return response.response as List<User>;
  //   }
  //   if (response is Failure) {
  //     throw BaseException(
  //       message: response.errorResponse.toString(),
  //       stackTrace: StackTrace.current,
  //     );
  //   }
  //   return [];
  // }

  Future<void> fetchAssignedMechanic(String mechanicIdx) async {
    final response =
        await ref.watch(userRepositoryProvider).fetchUserInfo(mechanicIdx);

    ref.read(assignedMechanicProvider.notifier).state = response;
  }

  // Future<User?> fetchMechanicInfo(String mechanicId) async {
  //   return await _fetchMechanic(mechanicId);
  // }

  Future<ReviewAndRating> rateAndReviewMechanic(String mechanicIdx,
      String repairRequestIdx, int stars, String review) async {
    Map<String, dynamic> body = {
      "rating": stars.toString(),
      "review": review,
      "user": mechanicIdx,
      "repair_request": repairRequestIdx,
    };
    return await ref.read(userRepositoryProvider).rateAndReviewUser(body);
  }

  void dispose() => _mechanicState.close();
}

final mechanicServiceProvider = Provider((ref) {
  final mechanicService = MechanicService(ref: ref);
  ref.onDispose(() => mechanicService.dispose());
  return mechanicService;
});

final fetchMechanicInfoProvider =
    FutureProvider.autoDispose.family<Mechanic, String>((ref, mechanicId) {
  return ref.watch(mechanicRepositoryProvider).fetchMechanicInfo(mechanicId);
});

final fetchMechanicRouteProvider = FutureProvider.autoDispose((ref) => ref
    .watch(mapRepositoryProvider)
    .getRoute(LatLng(27.987731866277297, 85.05683898925781),
        LatLng(27.697740170751363, 85.3749704360962)));

final fetchRecommendedMechanicsProvider = FutureProvider.autoDispose
    .family<List<User>, Map<String, dynamic>>((ref, info) {
  return ref
      .watch(userRepositoryProvider)
      .fetchRecommendedMechanics(info['vehicle_category'], info['service']);
});
