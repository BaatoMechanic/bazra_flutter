import 'package:bato_mechanic/src/shared/repositories/user_repository/user_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating/reviews_and_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import "package:latlong2/latlong.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/user.dart';
import '../repositories/map_repository/map_repository.dart';

part 'mechanic_service.g.dart';

// do not delete this line
// final assignedMechanicProvider = StateProvider<User?>((ref) => null);

class MechanicService {
  MechanicService({
    required this.ref,
  });

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
      "mechanic": mechanicIdx,
      "repair_request_idx": repairRequestIdx,
    };
    return await ref.read(userRepositoryProvider).rateAndReviewUser(body);
  }
}

@riverpod
MechanicService mechanicService(MechanicServiceRef ref) =>
    MechanicService(ref: ref);

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
