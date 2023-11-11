enum ErrorAlertType { NOTIFICATION, CENTER_ALERT_DIALOGUE }

class BaseException implements Exception {
  BaseException(
      {required this.message,
      this.alertType = ErrorAlertType.CENTER_ALERT_DIALOGUE});

  final String message;
  final ErrorAlertType alertType;

  @override
  String toString() => 'BaseException: $message';
}
