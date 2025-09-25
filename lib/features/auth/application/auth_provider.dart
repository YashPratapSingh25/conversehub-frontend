import 'package:conversehub/core/utils/dio_service.dart';
import 'package:conversehub/core/utils/secure_storage_service.dart';
import 'package:conversehub/core/utils/shared_preferences_service.dart';
import 'package:conversehub/features/auth/data/auth_repository.dart';
import 'package:conversehub/features/auth/data/google_sign_in.dart';
import 'package:flutter/material.dart';

DioService _dio = DioService();
final _sharedPrefs = SharedPreferencesService();
final _secureStorage = SecureStorageService();
final _authRepository = AuthRepository(dio: _dio);
final _authService = GoogleAuthService();

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = true;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  void autoLogin() async {
    try {
      String? userId = await _sharedPrefs.read("UserId");
      String? accessToken = await _secureStorage.read("AccessToken");
      String? refreshToken = await _secureStorage.read("RefreshToken");

      if (userId == null || accessToken == null || refreshToken == null) {
        _isLoggedIn = false;
        _isLoading = false;
        notifyListeners();
        return;
      }

      print(userId);
      print(accessToken);
      print(refreshToken);

      Map <String, dynamic>? checkTokenResponse = await _authRepository.checkAccessToken(accessToken);

      print(checkTokenResponse);
      if (checkTokenResponse == null || checkTokenResponse["status_code"] == 401) {
        Map <String, dynamic>? refreshResponse = await _authRepository
          .refreshAccessToken(
            userId,
            refreshToken
        );
        if (refreshResponse == null) {
          _isLoading = false;
          notifyListeners();
          return;
        }

        else if (refreshResponse["status_code"] != 200) {
          _isLoggedIn = false;
          _isLoading = false;
          notifyListeners();
          return;
        } else if (refreshResponse["status_code"] == 200) {
          userId = refreshResponse["data"]["user_id"];
          accessToken = refreshResponse["data"]["access_token"];
          refreshToken = refreshResponse["data"]["refresh_token"];

          await _sharedPrefs.write("UserId", userId!);
          await _secureStorage.write("AccessToken", accessToken!);
          await _secureStorage.write("RefreshToken", refreshToken!);

          _isLoggedIn = true;
          _isLoading = false;
          notifyListeners();
          return;
        }
      } else if (checkTokenResponse["status_code"] == 200){
        _isLoggedIn = true;
        _isLoading = false;
        notifyListeners();
        return;
      }
      else{
        _isLoggedIn = false;
        _isLoading = false;
        notifyListeners();
        return;
      }
    } catch (e) {
      _isLoading = false;
      _isLoggedIn = false;
      notifyListeners();
    }
  }

  void login() async {
    _isLoading= true;

    String? idToken = await _authService.signIn();
    if (idToken == null) {
      return;
    }
    
    Map<String, dynamic>? response = await _authRepository.signInWithGoogle(idToken);
    if (response == null || response["status_code"] != 200){
      _isLoading = false;
      _isLoggedIn = false;
      notifyListeners();
      return;
    }

    String userId = response["data"]["user_id"];
    String accessToken = response["data"]["access_token"];
    String refreshToken = response["data"]["refresh_token"];

    await _sharedPrefs.write("UserId", userId);
    await _secureStorage.write("AccessToken", accessToken);
    await _secureStorage.write("RefreshToken", refreshToken);

    _isLoading = false;
    _isLoggedIn = true;
    notifyListeners();
  }
}