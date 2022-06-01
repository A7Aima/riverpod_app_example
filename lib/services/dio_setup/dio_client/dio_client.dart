import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient(dio) {
    _dio = dio;
  }

  Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response? response;
    try {
      response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      return response;
    }
  }
}
