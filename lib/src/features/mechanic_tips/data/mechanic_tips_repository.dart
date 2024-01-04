import 'package:bato_mechanic/src/features/mechanic_tips/data/api_mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/domain/mechanic_tip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fake_mechanic_tips_repository.dart';

abstract class MechanicTipsRepository {
  Future<List<MechanicTip>> fetchMechanicTips();
}

final mechanicTipRepositoryProvider =
    // Provider<MechanicTipsRepository>((ref) => FakeMechanicTipsRepository());
    Provider<MechanicTipsRepository>((ref) => APIMechanicTipsRepository(ref));

final fetchMechanicTipsProvider = FutureProvider.autoDispose(
    (ref) => ref.watch(mechanicTipRepositoryProvider).fetchMechanicTips());
