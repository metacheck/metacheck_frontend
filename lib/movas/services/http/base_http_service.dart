import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';

abstract class BaseHttpService {
  Future<T> post<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  });

  Future<T> get<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  });

  Future<T> put<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  });

  Future<T> delete<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  });
  Future<T> patch<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  });

  Future<String?> get refreshToken;
}
