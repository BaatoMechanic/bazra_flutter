enum ErrorAlertType { NOTIFICATION, CENTER_ALERT_DIALOGUE }

class BaseException implements Exception {
  BaseException(
      {required this.message,
      this.alertType = ErrorAlertType.CENTER_ALERT_DIALOGUE});

  final String message;
  // Alert type is used to show different types of alerts like notification or center dialogue
  // see async_value_extension.dart to see the implementation
  final ErrorAlertType alertType;

  @override
  String toString() => 'BaseException: $message';
}
