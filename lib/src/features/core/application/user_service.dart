// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/in_memory_store.dart';
import '../../auth/domain/user.dart';

class UserService {
  UserService({
    required this.ref,
  });

  final _userState = InMemoryStore<User?>(null);
  final Ref ref;

  Stream<User?> userStateChanges() => _userState.stream;
  User? get currentUser => _userState.value;

  void setCurrentUser(User? user) => _userState.value = user;

  void dispose() => _userState.close();
}

final userServiceProvider = Provider((ref) {
  final service = UserService(ref: ref);
  // ref.onDispose(() => service.dispose());
  return service;
});

final watchUserStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  final authService = ref.watch(userServiceProvider);
  return authService.userStateChanges();
});

// final watchUserPositionMarkerProvider =
//     StreamProvider.autoDispose<LocationMarkerPosition?>((ref) {
//   final authService = ref.watch(userServiceProvider);
//   Stream<LocationMarkerPosition?> userLocationMarker =
//       authService._userState.stream.map((user) => user?.currentLocation == null
//           ? null
//           : LocationMarkerPosition(
//               latitude: user!.currentLocation!.latitude,
//               longitude: user.currentLocation!.longitude,
//               accuracy: user.currentLocation!.accuracy,
//             ));
//   return userLocationMarker;
// });
