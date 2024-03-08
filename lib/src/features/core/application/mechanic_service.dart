import 'package:bato_mechanic/src/features/auth/domain/mechanic.dart';
import 'package:bato_mechanic/src/features/core/data/user_repository/user_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import "package:latlong2/latlong.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../auth/domain/user.dart';
import '../data/map_repository/map_repository.dart';
import '../data/mechanic_repository/mechanic_repository.dart';

part 'mechanic_service.g.dart';

// do not delete this line
// final assignedMechanicProvider = StateProvider<User?>((ref) => null);

class MechanicService {
  MechanicService({
    required this.ref,
  });

  final _mechanicState = InMemoryStore<User?>(null);
  final Ref ref;

  // Future<void> fetchAssignedMechanic(String mechanicIdx) async {
  //   final response =
  //       await ref.watch(userRepositoryProvider).fetchUserInfo(mechanicIdx);

  // do not delete this line
  // ref.read(assignedMechanicProvider.notifier).state = response;
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

@riverpod
MechanicService mechanicService(MechanicServiceRef ref) {
  final service = MechanicService(ref: ref);
  ref.onDispose(() => service.dispose());
  return service;
}

@riverpod
Future<Mechanic> fetchMechanicInfo(
    FetchMechanicInfoRef ref, String mechanicId) {
  return ref.watch(mechanicRepositoryProvider).fetchMechanicInfo(mechanicId);
}

@riverpod
Future<Map<String, dynamic>> fetchMechanicRoute(FetchMechanicRouteRef ref) =>
    ref.watch(mapRepositoryProvider).getRoute(
        LatLng(27.987731866277297, 85.05683898925781),
        LatLng(27.697740170751363, 85.3749704360962));

@riverpod
Future<List<User>> fetchRecommendedMechanics(FetchRecommendedMechanicsRef ref,
        String vehicleCategoryIdx, String serviceIdx) =>
    ref
        .watch(userRepositoryProvider)
        .fetchRecommendedMechanics(vehicleCategoryIdx, serviceIdx);
