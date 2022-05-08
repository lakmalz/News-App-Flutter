import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news_app/data/remote/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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
      ..options.connectTimeout = APIConstant.defaultTimeout
      ..options.receiveTimeout = APIConstant.defaultTimeout;
  }

  _intercepterWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers[APIConstant.xAPIKey] = APIConstant.apiKey;
        options.headers[HttpHeaders.contentTypeHeader] = APIConstant.contentType;
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
