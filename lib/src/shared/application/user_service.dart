import 'package:bato_mechanic/src/features/auth/application/auth_state.dart';
import 'package:bato_mechanic/src/shared/domain/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/user_repository/user_repository.dart';

part "user_service.g.dart";

class UserService {
  UserService({required this.ref});

  final Ref ref;

  Future<User> updateUserProfile(Map<String, dynamic> data) async {
    User user = await ref.read(userRepositoryProvider).updateProfile(data);

    ref.read(authStateNotifierProvider.notifier).setUser(user);
    return user;
  }
}

@riverpod
UserService userService(UserServiceRef ref) {
  return UserService(ref: ref);
}
