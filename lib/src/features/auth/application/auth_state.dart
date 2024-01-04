// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user.dart';

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

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState(isAuthenticated: false));

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

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});
