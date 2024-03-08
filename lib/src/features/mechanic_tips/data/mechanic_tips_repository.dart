import 'package:bato_mechanic/main.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/data/api_mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/domain/mechanic_tip/mechanic_tip.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_mechanic_tips_repository.dart';

part 'mechanic_tips_repository.g.dart';

abstract class MechanicTipsRepository {
  Future<List<MechanicTip>> fetchMechanicTips();
}

@riverpod
MechanicTipsRepository mechanicTipRepository(MechanicTipRepositoryRef ref) =>
    SHOW_FAKE ? FakeMechanicTipsRepository() : APIMechanicTipsRepository(ref);

@riverpod
Future<List<MechanicTip>> fetchMechanicTips(FetchMechanicTipsRef ref) =>
    ref.watch(mechanicTipRepositoryProvider).fetchMechanicTips();
