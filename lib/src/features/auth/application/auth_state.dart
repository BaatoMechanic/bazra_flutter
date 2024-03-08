import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user.dart';
part 'auth_state.g.dart';

class AuthState {
  AuthState({required this.isAuthenticated, this.user});

  final bool isAuthenticated;
  final User? user;

  AuthState copyWith({
    bool? isAuthenticated,
    User? user,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }
}

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  dynamic build() {
    return AuthState(isAuthenticated: false);
  }

  void setUser(User? user) {
    state = state.copyWith(user: user);
  }

  User? get user {
    return state.user;
  }

  void clearUser() {
    state = state.copyWith(user: null);
  }
}
