import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio;

  const AuthService(this._dio);

  Future<Response<String>> getUserToken() async {
    return await _dio.get('path');
  }
}
