import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mechanic_tips_service.g.dart';

class MechanicTipsService {
  MechanicTipsService(this.ref);

  final Ref ref;
}

@riverpod
MechanicTipsService mechanicTipsService(MechanicTipsServiceRef ref) {
  return MechanicTipsService(ref);
}
