import 'package:bato_mechanic/src/utils/exceptions/base_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../helpers/toast_helper.dart';

extension AsyncValueExtensions on AsyncValue {
  void showError(BuildContext context,
      {ErrorAlertType alertType = ErrorAlertType.NOTIFICATION}) {
    if (!isRefreshing && hasError) {
      if (error is BaseException) {
        final err = error as BaseException;
        if (alertType == ErrorAlertType.NOTIFICATION) {
          ToastHelper.showNotification(context, err.message);
        } else {
          ToastHelper.showCenterAlert(context, err.message);
        }

        if (err.redirectLink != null) {
          context.goNamed(err.redirectLink!);
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
