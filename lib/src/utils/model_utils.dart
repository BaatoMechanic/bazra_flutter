// ignore_for_file: public_member_api_docs, sort_constructors_first
class Success {
  int code;
  Object response;

  Success({required this.code, required this.response});
}

class Failure {
  int code;
  String? errorCode;
  Object errorResponse;
  StackTrace stackTrace;
  String? redirectLink;

  Failure({
    this.errorCode,
    this.redirectLink,
    required this.code,
    required this.errorResponse,
    required this.stackTrace,
  });
}
