import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/styles/resources.dart';

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
      this.message = Resources.somethingWentWrong;
    }
    Get.printError(info: error.toString());
  }

  _handleError(DioError error) {
    title = Resources.networkError;
    switch (error.type) {
      case DioErrorType.cancel:
        message = Resources.requestCancelError;
        break;
      case DioErrorType.connectTimeout:
        message = Resources.connectionTimeout;
        break;
      case DioErrorType.other:
        message = Resources.internetConnectionError;
        break;
      case DioErrorType.receiveTimeout:
        message = Resources.receiveTimeout;
        break;
      case DioErrorType.response:
        if (error.response?.data != null) {
          try {
            message = error.response?.data['message'];
          } catch (e) {
            message = Resources.somethingWentWrong;
          }
        }
        break;
      case DioErrorType.sendTimeout:
        message = Resources.sendTimeout;
        break;
      default:
        message = Resources.somethingWentWrong;
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
