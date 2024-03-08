import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mechanic_tips_service.g.dart';

class MechanicTipsService {
  MechanicTipsService(this.ref);

  final Ref ref;

  // final _allMechanicTipsState = InMemoryStore<List<MechanicTip>>([]);

  // Stream<List<MechanicTip>> _allMechanicTipsStateChanges() =>
  //     _allMechanicTipsState.stream;
  // List<MechanicTip> get allMechanicTips => _allMechanicTipsState.value;

  // void setAllMechanicTips(List<MechanicTip> mechanicTips) {
  //   _allMechanicTipsState.value = mechanicTips;
  // }
}

@riverpod
MechanicTipsService mechanicTipsService(MechanicTipsServiceRef ref) {
  return MechanicTipsService(ref);
}
