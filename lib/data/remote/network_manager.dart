import 'dart:io';

import 'package:dio/dio.dart';

const defaultTimeout = Duration.millisecondsPerMinute;
const apiKey =
    '9284c0a465834e018c24e134ac255a72'; //TODO key should use by separate

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
        handler.next(error);
      },
    );
  }
}
