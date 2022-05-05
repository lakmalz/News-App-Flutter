import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const defaultTimeout = Duration.millisecondsPerMinute;
// const apiKey =
//     '9284c0a465834e018c24e134ac255a72'; //TODO key should use by separate
const apiKey =
    'f0383482278d4b14a0d981d345ce9661'; //TODO key should use by separate

class NetworkManager {
  factory NetworkManager({required String baseUrl}) {
    return NetworkManager._internal(baseUrl);
  }

  NetworkManager._internal(String baseUrl) {
    _baseUrl = baseUrl;
  }

  late String _baseUrl;

  Dio get dio => _getDioWithHeaders();

  Dio _getDioWithHeaders() {
    return Dio()
      ..interceptors.addAll([
        _intercepterWrapper(),
        PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              responseHeader: false,
              compact: false,
              maxWidth: 70,
              logPrint: (o) {
                Get.log(o.toString());
              })
      ])
      ..options.baseUrl = _baseUrl
      ..options.connectTimeout = defaultTimeout
      ..options.receiveTimeout = defaultTimeout;
  }

  _intercepterWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['X-Api-Key'] = apiKey;
        options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
        handler.next(options);
      },
      onResponse: (res, handler) {
        handler.next(res);
      },
      onError: (error, handler) {
        handler.next(error);
      },
    );
  }
}
