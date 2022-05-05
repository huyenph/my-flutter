import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio;

  const AuthApiService(this._dio);

  Future<Response<String>> getUserToken() async {
    return await _dio.get('path');
  }
}
