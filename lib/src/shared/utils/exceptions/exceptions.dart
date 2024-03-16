import 'package:bato_mechanic/src/shared/utils/exceptions/base_exception.dart';

class HttpError extends BaseException {
  HttpError(
      {super.message = "Http error",
      super.errorCode = "http_error",
      required super.stackTrace});
}

class FormatError extends BaseException {
  FormatError(
      {super.message = "Format error",
      super.errorCode = "format_error",
      required super.stackTrace});
}

class UnknownError extends BaseException {
  UnknownError(
      {super.message = "Unknown error",
      super.errorCode = "unknown_error",
      required super.stackTrace});
}

class BadRequestError extends BaseException {
  BadRequestError(
      {super.message = "Bad request error",
      super.errorCode = "bad_request_error",
      required super.stackTrace});
}

class UnauthorizedError extends BaseException {
  UnauthorizedError(
      {super.message = "Unauthorized error",
      super.errorCode = "unauthorized_error",
      required super.stackTrace});
}
