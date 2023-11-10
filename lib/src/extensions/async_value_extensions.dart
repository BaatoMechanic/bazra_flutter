import 'package:bato_mechanic/src/exceptions/base_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/toast_helper.dart';

extension AsyncValueExtensions on AsyncValue {
  void showError(BuildContext context,
      {ErrorAlertType alertType = ErrorAlertType.NOTIFICATION}) {
    if (!isRefreshing && hasError) {
      if (error.runtimeType == BaseException) {
        final err = error as BaseException;
        if (err.alertType == ErrorAlertType.NOTIFICATION) {
          ToastHelper.showNotification(context, err.message);
        } else {
          ToastHelper.showCenterAlert(context, err.message);
        }
        return;
      }

      if (alertType == ErrorAlertType.NOTIFICATION) {
        ToastHelper.showNotification(context, error.toString());
      } else {
        ToastHelper.showCenterAlert(context, error.toString());
      }
    }
  }
}
