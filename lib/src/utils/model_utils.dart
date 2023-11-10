class Success {
  int code;
  Object response;

  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  StackTrace stackTrace;

  Failure(
      {required this.code,
      required this.errorResponse,
      required this.stackTrace});
}
