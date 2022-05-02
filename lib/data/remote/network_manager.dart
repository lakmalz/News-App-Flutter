import 'dart:io';

import 'package:dio/dio.dart';

const defaultTimeout = Duration.millisecondsPerMinute;
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
        return handler.next(error);
      },
    );
  }
}
