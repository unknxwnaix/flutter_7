import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'interceptors/auth_interceptor.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient(String apiKey) {
    _dio.options.baseUrl = 'https://api.api-ninjas.com';
    _dio.interceptors.add(AuthInterceptor(apiKey));
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get dio => _dio;
}