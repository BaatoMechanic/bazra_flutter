import 'package:flutter_riverpod/flutter_riverpod.dart';


class MechanicProfileScreenController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  MechanicProfileScreenController({
    required this.ref,
  }) : super(const AsyncData(null));
}

final mechanicProfileScreenControllerProvider =
    StateNotifierProvider<MechanicProfileScreenController, AsyncValue<void>>(
        (ref) {
  return MechanicProfileScreenController(ref: ref);
});
