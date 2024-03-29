import 'package:bato_mechanic/src/features/mechanic_tips/data/mechanic_tips_repository.dart';
import 'package:bato_mechanic/src/features/mechanic_tips/domain/mechanic_tip.dart';
import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/in_memory_store.dart';
import '../../../utils/model_utils.dart';

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

final mechanicTipsServiceProvider = Provider((ref) => MechanicTipsService(ref));

// final watchAllMechanicTipsProvider = StreamProvider<List<MechanicTip>>((ref) {
//   final serviceProvider = ref.watch(mechanicTipsServiceProvider);
//   return serviceProvider._allMechanicTipsStateChanges();
// });
