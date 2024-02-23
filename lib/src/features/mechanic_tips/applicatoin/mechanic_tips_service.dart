import 'package:flutter_riverpod/flutter_riverpod.dart';


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
