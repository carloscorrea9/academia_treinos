import 'package:academia_treinos/app/config.dart';
import 'package:academia_treinos/core/network/auth_interceptor.dart';
import 'package:academia_treinos/core/network/mock_interceptor.dart';
import 'package:academia_treinos/core/storage/session_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static Dio create(
    SessionStorage storage,
    MockInterceptor mockInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: const {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(AuthInterceptor(storage));
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
    dio.interceptors.add(mockInterceptor);
    return dio;
  }
}
