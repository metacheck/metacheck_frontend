import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:metacheck_frontend/helpers/app_constants.dart';
import 'package:metacheck_frontend/movas/services/http/requests/base_http_request.dart';
import 'package:metacheck_frontend/movas/services/local_storage/local_storage_keys.dart';
import 'package:metacheck_frontend/movas/services/local_storage/local_storage_service.dart';

import 'base_http_service.dart';

class DioHttpService extends BaseHttpService {
  final Dio dio;
  final LocalStorageService localStorageService;

  DioHttpService(this.dio, this.localStorageService,
      {String baseUrl = AppConstants.BASE_URL}) {
    dio.options.baseUrl = baseUrl;

    dio.options.connectTimeout = 200000; //5s
    dio.options.receiveTimeout = 50000;

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
        var token = await refreshToken;
        if (token != null && options.path != "/users/sign_in/")
          options.headers.addAll({"authorization": "Bearer " + token});

        return handler.next(options);
      }, onResponse: (Response response, handler) {
        return handler.next(response);
      }, onError: (DioError error, handler) {
        print("HTTP Error: ${error.message}");
        return handler.next(error);
      }),
    );
  }

  @override
  Future<T> get<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  }) async {
    var options = Options(
      contentType: Headers.jsonContentType,
    );

    final map = request.toMap();

    final response =
        await dio.get(request.endpoint, queryParameters: map, options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));

      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    //Todo: Need to discuss whats the format of responses received from api
    if (response.data is List<dynamic>) {
      //convert it to a map
      Map<String, dynamic> map = {};
      for (var i = 0; i < response.data.length; i++) {
        map[i.toString()] = response.data[i];
      }

      return converter(map);
    }

    return converter(response.data);
  }

  @override
  Future<T> post<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  }) async {
    var options = Options(
      contentType: Headers.jsonContentType,
    );

    final map = request.toMap();

    final response =
        await dio.post(request.endpoint, data: map, options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));
      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<T> patch<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  }) async {
    var options = Options(
      contentType: Headers.jsonContentType,
    );

    final map = request.toMap();

    final response =
        await dio.patch(request.endpoint, data: map, options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));
      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<T> delete<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  }) async {
    var options = Options(
      contentType: Headers.jsonContentType,
    );

    final map = request.toMap();

    final response =
        await dio.delete(request.endpoint, data: map, options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));

      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<T> put<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  }) async {
    var options = Options(
      contentType: Headers.jsonContentType,
    );

    final map = request.toMap();

    final response =
        await dio.put(request.endpoint, data: map, options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));
      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<String?> get refreshToken async {
    try {
      var token = await localStorageService
          .getValueForKey(LocalStorageKeys.refreshToken);
      return token;
    } catch (E) {
      return null;
    }
  }
}
