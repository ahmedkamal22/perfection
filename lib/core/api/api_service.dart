import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api/',
  ));

  Future<Response> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }
}
