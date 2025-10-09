import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/utils/dio_service.dart';

class AuthRepository{
  final DioService _dio;

  AuthRepository({
    required DioService dio,
  }) : _dio = dio;

  Future <Map<String, dynamic>?> checkAccessToken(String accessToken) async {
    try{
      var response = await _dio.get(
        path: "/api/auth/check-access-token",
        headers: {"Authorization": "Bearer $accessToken"}
      );
      print("Response: $response");
      return response;
    } catch (e) {
        print("Check Failed : $e");
        return {"Error": e};
    }
  }

  Future <Map<String, dynamic>?> signInWithGoogle(String idToken) async {
    try {
      Map<String, dynamic>? response = await _dio.post(
        path: "/api/auth/google",
        data: {
          "id_token": idToken
        }
      );
      return response;
    } catch (e) {
      print("Login Failed : $e");
      return {"Error": e};
    }
  }

  Future <Map<String, dynamic>?> refreshAccessToken(String userId, String refreshToken) async {
    try {
      Map<String, dynamic>? response = await _dio.post(
          path: "/api/auth/refresh",
          data: {
            "user_id": userId,
            "refresh_token": refreshToken
          }
      );
      return response;
    } catch (e) {
      print("Refresh Failed : $e");
      return {"Error": e};
    }
  }
}