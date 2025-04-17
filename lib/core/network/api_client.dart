import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastyready_mobile/core/errors/dio_exceptions.dart';
import 'package:tastyready_mobile/core/errors/exceptions.dart';

class ApiClient {
  final Dio _dio;
  static const  headers = {
    'Content-Type': 'application/json',
  };
  ApiClient({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: headers,
            ));

// Function to update headers after login
Future<void> updateAuthHeaders(String token) async {
  _dio.options.headers['Authorization'] = 'Bearer $token';
  // Optionally save token for persistence
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("token", token);
}





  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(String url, {dynamic data}) async {
    updateAuthHeaders("token");
    try {
      final response = await _dio.post(url, data: jsonEncode(data));
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleError(e);
    }
  }
  Future<dynamic> postWithFile(String url, {required Map<String, dynamic> data, required File file, String fileFieldName = 'file'}) async {
    try {
      final formData = FormData.fromMap({
        ...data,
        fileFieldName: await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      });
      final response = await _dio.post(url, data: formData);
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleError(e);
    }
  }
  Future<dynamic> postFormData(String url, {required Map<String, dynamic> formData}) async {
    try {
      final formDataObject = FormData.fromMap(formData);

      final response = await _dio.post(
        
        url, data: formDataObject);
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleError(e);
    }
  }


  Future<dynamic> put(String url, {dynamic data}) async {
    try {
      final response = await _dio.put(url, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> delete(String url, {dynamic data}) async {
    try {
      final response = await _dio.delete(url, data: data);
      return _handleResponse(response);
    } 
    on DioException catch (e) {
      _handleError(e);
    }
  }

    dynamic _handleResponse(Response response) {
      log(response.data.toString());
    final message = response.data['errMsg'];
    
    log("STATS${response.statusCode}");
    switch (response.statusCode) {
      case 200:
      case 201:
        if(response.data['status']==false  && response.data.keys.contains('errMsg')){  
         final errors =response.data['errMsg'] as Map<String, dynamic>;
      throw ValidationException(json.encode(errors));
        }
        return response.data; 

      case 400:
     
        throw BadRequestException(
          
          
          response.data['errMsg']);
      case 401:
        throw UnauthorizedException(message);
      case 403:
        throw ForbiddenException(message);
      case 404:
        throw NotFoundException(message);
      case 422:
      log("kjkjkjkjkjk");
          final errors =response.data['errMsg'] as Map<String, dynamic>;
      throw ValidationException(json.encode(errors));
      case 500:
        throw ServerException(message: message);
      default:
        throw ApiException('Unknown Error', response.statusCode!);
    }
    }
 
  void _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      throw Exception("Connection timeout. Please try again.");
    } else if (error.type == DioExceptionType.receiveTimeout) {
      throw Exception("Receive timeout. Please try again.");
    } else if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode;
      final message = error.response?.data['message'] ?? 'Something went wrong';
      // throw Exception("Error $statusCode: $message");
  switch (statusCode) {
    case 400:
     
        throw BadRequestException(
          
          
          error.response?.data['errMsg']);
      case 401:
        throw UnauthorizedException(message);
      case 403:
        throw ForbiddenException(message);
      case 404:
        throw NotFoundException(message);
      case 422:
      log("kjkjkjkjkjk");
          final errors =error.response?.data['errMsg'] as Map<String, dynamic>;
      throw ValidationException(json.encode(errors));
      case 500:
        throw ServerException(message: message);
      default:
        throw ApiException('Unknown Error',statusCode!);
  }

    } else if (error.type == DioExceptionType.cancel) {
      throw Exception("Request was cancelled.");
    } else if (error.type == DioExceptionType.unknown && error.error is SocketException) {
      throw Exception("No internet connection. Please check your network.");
    } else {
      throw Exception("Unexpected error occurred: ${error.message}");
    }
  }
}