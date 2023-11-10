// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bato_mechanic/src/extensions/string_extension.dart';

import 'toast_helper.dart';

class SystemAlertState {
  final bool loading;
  final String? message;

  SystemAlertState({
    required this.loading,
    this.message,
  });

  SystemAlertState copyWith({
    bool? loading,
    String? message,
  }) {
    return SystemAlertState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loading': loading,
      'message': message,
    };
  }

  factory SystemAlertState.fromMap(Map<String, dynamic> map) {
    return SystemAlertState(
      loading: map['loading'] as bool,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemAlertState.fromJson(String source) =>
      SystemAlertState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SystemAlertState(loading: $loading, message: $message)';

  @override
  bool operator ==(covariant SystemAlertState other) {
    if (identical(this, other)) return true;

    return other.loading == loading && other.message == message;
  }

  @override
  int get hashCode => loading.hashCode ^ message.hashCode;
}

class SystemAlert extends StateNotifier<SystemAlertState> {
  SystemAlert({required this.ref}) : super(SystemAlertState(loading: false));
  final Ref ref;

  setAlertMessage(String? message) {
    state = state.copyWith(message: message);
  }

  showLoadingWithMessageOptional(BuildContext context, {message}) {
    // If loading is enabled then do not instantiate new loading but just change the loading message
    if (!state.loading) {
      ToastHelper.showLoading(context);
    }
    state = state.copyWith(loading: true, message: message);
  }

  closeLoading(BuildContext context) {
    if (state.loading) {
      state = state.copyWith(
        loading: false,
        message: null,
      );
      Navigator.of(context).pop();
    }
  }
}

final systemAlertProvider =
    StateNotifierProvider<SystemAlert, SystemAlertState>((ref) {
  return SystemAlert(ref: ref);
});
