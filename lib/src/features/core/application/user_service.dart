import 'package:bato_mechanic/src/features/core/data/user_repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/domain/user.dart';

part 'user_service.g.dart';

class UserService {
  UserService({
    required this.ref,
  });

  final Ref ref;
}

@riverpod
UserService userService(UserServiceRef ref) => UserService(ref: ref);

@riverpod
Future<User> fetchUserInfo(FetchUserInfoRef ref, String userIdx) =>
    ref.watch(userRepositoryProvider).fetchUserInfo(userIdx);
