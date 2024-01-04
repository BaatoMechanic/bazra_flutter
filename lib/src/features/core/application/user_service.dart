// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../utils/in_memory_store.dart';
// import '../../auth/domain/user.dart';

// class UserService {
//   UserService({
//     required this.ref,
//   });

//   final _userState = InMemoryStore<User?>(null);
//   final Ref ref;

//   Stream<User?> userStateChanges() => _userState.stream;
//   User? get currentUser => _userState.value;

//   void setCurrentUser(User? user) => _userState.value = user;

//   void dispose() => _userState.close();
// }

// final userServiceProvider = Provider((ref) {
//   final service = UserService(ref: ref);
//   // ref.onDispose(() => service.dispose());
//   return service;
// });

// final watchUserStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
//   final authService = ref.watch(userServiceProvider);
//   return authService.userStateChanges();
// });

// // final watchUserPositionMarkerProvider =
// //     StreamProvider.autoDispose<LocationMarkerPosition?>((ref) {
// //   final authService = ref.watch(userServiceProvider);
// //   Stream<LocationMarkerPosition?> userLocationMarker =
// //       authService._userState.stream.map((user) => user?.currentLocation == null
// //           ? null
// //           : LocationMarkerPosition(
// //               latitude: user!.currentLocation!.latitude,
// //               longitude: user.currentLocation!.longitude,
// //               accuracy: user.currentLocation!.accuracy,
// //             ));
// //   return userLocationMarker;
// // });

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bato_mechanic/src/features/core/data/user_repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/exceptions/base_exception.dart';
import '../../../utils/model_utils.dart';
import '../../auth/domain/user.dart';

class UserService {
  UserService({
    required this.ref,
  });

  final Ref ref;

  Future<User?> fetchUserInfo(String userIdx) async {
    final response =
        await ref.read(userRepositoryProvider).fetchUserInfo(userIdx);

    if (response is Success) {
      return User.fromJson(jsonDecode((jsonEncode(response.response))));
    }

    if (response is Failure) {
      throw BaseException(
        message: response.errorResponse.toString(),
        stackTrace: StackTrace.current,
      );
    }
    return null;
  }
}

final userServiceProvider = Provider((ref) {
  final service = UserService(ref: ref);
  // ref.onDispose(() => service.dispose());
  return service;
});

final fetchUserInfoProvider =
    FutureProvider.family<User?, String>((ref, userIdx) {
  final service = ref.watch(userServiceProvider);
  return service.fetchUserInfo(userIdx);
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
