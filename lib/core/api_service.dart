import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  ApiService._internal();
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  final Dio dio = Dio(
    BaseOptions(
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        persistentConnection: true,
        responseType: ResponseType.json,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "*/*",
        }),
  );

  Future<dynamic> get(String endpoint, String messageForError) async {
    try {
      final response = await dio.get(endpoint);
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to $messageForError: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'Unknown error occurred';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection timeout. Please try again later.';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Receive timeout. Server took too long to respond.';
      } else if (e.type == DioExceptionType.badResponse) {
        errorMessage =
            'Failed to $messageForError: ${e.response?.statusCode} ${e.response?.statusMessage}';
      } else if (e.type == DioExceptionType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'Network error. Please check your connection.';
      }

      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
