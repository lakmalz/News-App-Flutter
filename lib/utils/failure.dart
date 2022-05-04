import 'package:dio/dio.dart';
import 'package:get/get.dart';
const error = 'Error';
const networkError = 'Network error';
const somethingWentWrong = 'Something went wrong, Please try again.';
const sendTimeout = 'Receive timeout in send request';
const receiveTimeout = 'Receive timeout in connection';
const internetConnectionError =
    'Connection failed due to internet connection';
const connectionTimeout = 'Connection timeout';
const requestCancelError = 'Request was cancelled';
class Failure implements Exception {
  Failure();

  late dynamic error;
  late int? _errorCode;
  late String message;
  late String? title;
  late String status;

  Failure.init({error, title = '', message = '', status = ''}) {
    this.error = error;
    this.title = title ?? '';
    this.message = message ?? '';
    this.status = status ?? '';

    if (error?.runtimeType == DioError) {
      _errorCode = error.response?.statusCode;
      _handleError(error);
    } else if (error?.runtimeType == GenericException) {
      this.title = error;
      this.message = (error as GenericException).message;
    } else if (this.message.isNotEmpty) {
      this.title = title;
      this.message = message;
    } else {
      this.title = error;
      this.message = somethingWentWrong;
    }
    Get.printError(info: error.toString());
  }

  _handleError(DioError error) {
    title = networkError;
    switch (error.type) {
      case DioErrorType.cancel:
        message = requestCancelError;
        break;
      case DioErrorType.connectTimeout:
        message = connectionTimeout;
        break;
      case DioErrorType.other:
        message = internetConnectionError;
        break;
      case DioErrorType.receiveTimeout:
        message = receiveTimeout;
        break;
      case DioErrorType.response:
        if (error.response?.data != null) {
          try {
            message = error.response?.data['message'];
          } catch (e) {
            message = somethingWentWrong;
          }
        }
        break;
      case DioErrorType.sendTimeout:
        message = sendTimeout;
        break;
      default:
        message = somethingWentWrong;
    }
    return message;
  }
}

class ConnectionExceptions implements Exception {}

class TimeoutException extends ConnectionExceptions {
  TimeoutException() : super();
}

class NetworkException extends ConnectionExceptions {
  NetworkException() : super();
}

class BadRequestException extends ConnectionExceptions {
  BadRequestException() : super();
}

class UnauthorisedException extends ConnectionExceptions {
  UnauthorisedException() : super();
}

class ServerException extends ConnectionExceptions {
  ServerException() : super();
}

class GenericException extends Failure {
  GenericException(String msg) : super.init(message: msg);
}
