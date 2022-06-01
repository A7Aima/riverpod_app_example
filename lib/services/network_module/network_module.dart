import 'package:dio/dio.dart';
import 'package:riverpod_app/constants/configs/config.dart';

class NetworkModule {
  Dio provideDio() {
    final dio = Dio();

    dio
      ..options.baseUrl = Configs.baseUrl
      ..options.connectTimeout = Configs.connectionTimeout
      ..options.receiveTimeout = Configs.receiveTimeout
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            handler.next(options);
          },
        ),
      );

    return dio;
  }
}
