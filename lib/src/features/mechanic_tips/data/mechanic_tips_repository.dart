import 'package:bato_mechanic/src/features/mechanic_tips/data/api_mechanic_tips_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


abstract class MechanicTipsRepository {
  Future<dynamic> fetchMechanicTips();
}

final mechanicTipRepositoryProvider =
    // Provider<MechanicTipsRepository>((ref) => FakeMechanicTipsRepository());
    Provider<MechanicTipsRepository>((ref) => APIMechanicTipsRepository(ref));
