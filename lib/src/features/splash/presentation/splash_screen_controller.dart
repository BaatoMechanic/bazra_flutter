import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/data/repair_request_repository/repair_request_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenController {
  SplashScreenController({
    required this.ref,
  });

  Ref ref;

  Future<bool> hasRepairRequest(String userId) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await ref
        .read(repairRequestServiceProvider)
        .fetchUserRepairRequests(userId);

    return response;
  }
}

final splashScreenControllerProvider =
    Provider.autoDispose((ref) => SplashScreenController(ref: ref));
