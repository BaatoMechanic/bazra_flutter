import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/helpers/toast_helper.dart';

part "system_alerts_controller.g.dart";

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

  @override
  bool operator ==(covariant SystemAlertState other) {
    if (identical(this, other)) return true;

    return other.loading == loading && other.message == message;
  }

  @override
  int get hashCode => loading.hashCode ^ message.hashCode;
}

@riverpod
class SystemAlert extends _$SystemAlert {
  @override
  dynamic build() {
    return SystemAlertState(loading: false);
  }

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
