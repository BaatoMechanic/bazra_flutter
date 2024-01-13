// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bato_mechanic/src/utils/model_utils.dart';

enum ErrorAlertType { NOTIFICATION, CENTER_ALERT_DIALOGUE }

ErrorAlertType errorAlertTypeFromJson(Map<String, dynamic> json) {
  switch (json['type'].toString().toUpperCase()) {
    case 'NOTIFICATION':
      return ErrorAlertType.NOTIFICATION;
    case 'CENTER_ALERT_DIALOGUE':
      return ErrorAlertType.CENTER_ALERT_DIALOGUE;
    default:
      return ErrorAlertType.CENTER_ALERT_DIALOGUE;
  }
}

class BaseException implements Exception {
  BaseException({
    required this.message,
    this.redirectLink,
    // this.alertType = ErrorAlertType.CENTER_ALERT_DIALOGUE,
    this.statusCode = HttpStatus.seeOther,
    this.errorCode = 'baato_mechanic_error',
    required this.stackTrace,
  });

  final String message;
  // Alert type is used to show different types of alerts like notification or center dialogue
  // see async_value_extension.dart to see the implementation
  // final ErrorAlertType alertType;
  final int statusCode;
  final String errorCode;
  final String? redirectLink;
  final StackTrace stackTrace;

  BaseException copyWith({
    String? message,
    ErrorAlertType? alertType,
    int? statusCode,
    String? errorCode,
    String? redirectLink,
    StackTrace? st,
  }) {
    return BaseException(
      message: message ?? this.message,
      // alertType: alertType ?? this.alertType,
      statusCode: statusCode ?? this.statusCode,
      errorCode: errorCode ?? this.errorCode,
      redirectLink: redirectLink ?? this.redirectLink,
      stackTrace: st ?? this.stackTrace,
    );
  }
}
