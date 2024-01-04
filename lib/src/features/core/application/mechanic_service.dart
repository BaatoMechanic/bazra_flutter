// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/features/core/data/user_repository/user_repository.dart';
import 'package:bato_mechanic/src/features/reviews_and_rating/domain/reviews_and_rating.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/utils/in_memory_store.dart';

import '../../auth/domain/user.dart';
import '../../track_mechanic/presentation/track_mechanic_screen_controller.dart';
import '../data/map_repository/map_repository.dart';
import '../data/mechanic_repository/mechanic_repository.dart';

final assignedMechanicProvider = StateProvider<User?>((ref) => null);

class MechanicService {
  MechanicService({
    required this.ref,
  });

  final _mechanicState = InMemoryStore<User?>(null);
  final Ref ref;

  Future<List<User>> fetchRecommendedMechanics(
      String vehicleCategoryId, String vehiclePartId) async {
    final response = await ref
        .watch(userRepositoryProvider)
        .fetchRecommendedMechanics(vehicleCategoryId, vehiclePartId);

    if (response is Success) {
      return response.response as List<User>;
    }
    if (response is Failure) {
      throw BaseException(
        message: response.errorResponse.toString(),
        stackTrace: StackTrace.current,
      );
    }
    return [];
  }

  Future<User> _fetchMechanic(String mechanicId) async {
    return await ref.watch(userRepositoryProvider).fetchUserInfo(mechanicId);
  }

  Future<void> fetchAssignedMechanic(String mechanicId) async {
    final response = await _fetchMechanic(mechanicId);

    ref.read(assignedMechanicProvider.notifier).state = response;
  }

  Future<User?> fetchMechanicInfo(String mechanicId) async {
    return await _fetchMechanic(mechanicId);
  }

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
    FutureProvider.autoDispose.family<User?, String>((ref, mechanicId) {
  final mechanicService = ref.watch(mechanicServiceProvider);
  return mechanicService.fetchMechanicInfo(mechanicId);
});

final fetchMechanicRouteProvider = FutureProvider.autoDispose((ref) => ref
    .watch(mapRepositoryProvider)
    .getRoute('85.33033043146135,27.703292452047425',
        '85.33825904130937,27.707645262018172'));
