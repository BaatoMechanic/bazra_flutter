// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/features/repair_request/domain/mechanic.dart';
import 'package:bato_mechanic/src/utils/in_memory_store.dart';
import 'package:http/http.dart';

import '../data/mechanic_repository/mechanic_repository.dart';
import 'vechicle_category_service.dart';

class MechanicService {
  MechanicService({
    required this.ref,
  });

  final _mechanicState = InMemoryStore<Mechanic?>(null);
  final Ref ref;

  Stream<Mechanic?> mechanicStateChanges() => _mechanicState.stream;
  Mechanic? get assignedMechanic => _mechanicState.value;

  void setAssignedMechanic(Mechanic mechanic) {
    _mechanicState.value = mechanic;
  }

  Future<List<Mechanic>> fetchRecommendedMechanics(
      String vehicleCategoryId, String vehiclePartId) async {
    final response = await ref
        .watch(mechanicRepositoryProvider)
        .fetchRecommendedMechanics(vehicleCategoryId, vehiclePartId);

    if (response is Success) {
      return response.response as List<Mechanic>;
    }
    if (response is Failure) {
      // throw Exception(response.errorResponse);
      throw BaseException(message: response.errorResponse.toString());
    }
    return [];
  }

  Future<dynamic> _fetchMechanic(String mechanicId) async {
    return await ref
        .watch(mechanicRepositoryProvider)
        .fetchMechanicInfo(mechanicId);
  }

  Future<void> fetchAssignedMechanic(String mechanicId) async {
    final response = await _fetchMechanic(mechanicId);

    if (response is Success) {
      // Mechanic mechanic = response.response as Mechanic;
      Mechanic mechanic = mechanicFromJson(response.response.toString());
      setAssignedMechanic(mechanic);
    }
    if (response is Failure) {
      throw BaseException(message: response.errorResponse.toString());
    }
  }

  Future<Mechanic?> fetchMechanicInfo(String mechanicId) async {
    final response = await _fetchMechanic(mechanicId);

    if (response is Success) {
      Mechanic mechanic = mechanicFromJson(response.response.toString());
      return mechanic;
    }
    if (response is Failure) {
      throw BaseException(message: response.errorResponse.toString());
    }
    return null;
  }

  Future<bool> rateAndReviewMechanic(
      String mechanicId, int stars, String review) async {
    final response = await ref
        .read(mechanicRepositoryProvider)
        .rateAndReviewMechanic(mechanicId, stars, review);
    if (response is Success) {
      return true;
    }
    return false;
  }

  void dispose() => _mechanicState.close();
}

final mechanicServiceProvider = Provider((ref) {
  final mechanicService = MechanicService(ref: ref);
  ref.onDispose(() => mechanicService.dispose());
  return mechanicService;
});

final watchMechanicStateChangesProvider =
    StreamProvider.autoDispose<Mechanic?>((ref) {
  final mechanicService = ref.watch(mechanicServiceProvider);
  return mechanicService.mechanicStateChanges();
});

final fetchMechanicInfoProvider =
    FutureProvider.autoDispose.family<Mechanic?, String>((ref, mechanicId) {
  final mechanicService = ref.watch(mechanicServiceProvider);
  return mechanicService.fetchMechanicInfo(mechanicId);
});
