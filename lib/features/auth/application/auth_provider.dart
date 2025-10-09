import 'package:conversehub/core/utils/dio_service.dart';
import 'package:conversehub/core/utils/secure_storage_service.dart';
import 'package:conversehub/core/utils/shared_preferences_service.dart';
import 'package:conversehub/features/auth/data/auth_repository.dart';
import 'package:conversehub/features/auth/data/google_sign_in.dart';
import 'package:flutter/material.dart';

DioService _dioService = DioService();
final _sharedPrefs = SharedPreferencesService();
final _secureStorage = SecureStorageService();
final _authService = GoogleAuthService();
final _authRepository = AuthRepository(dio: _dioService);

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = true;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  String? userId;
  String? firstName;
  String? lastName;
  String? accessToken;
  String? refreshToken;

  Future <void> _readStoredValues() async {
    userId = await _sharedPrefs.read("UserId");
    firstName = await _sharedPrefs.read("FirstName");
    lastName = await _sharedPrefs.read("LastName");
    accessToken = await _secureStorage.read("AccessToken");
    refreshToken = await _secureStorage.read("RefreshToken");
  }

  Future <void> _writeValues(Map <String, dynamic> response) async {
    userId = response["data"]["user_id"];
    firstName = response["data"]["first_name"];
    lastName = response["data"]["last_name"];
    accessToken = response["data"]["access_token"];
    refreshToken = response["data"]["refresh_token"];

    await _sharedPrefs.write("UserId", userId!);
    await _sharedPrefs.write("FirstName", firstName!);
    await _sharedPrefs.write("LastName", lastName!);
    await _secureStorage.write("AccessToken", accessToken!);
    await _secureStorage.write("RefreshToken", refreshToken!);
  }

  void _changeState({required bool isLoggedIn, required bool isLoading}) {
    _isLoggedIn = isLoggedIn;
    _isLoading = isLoading;
    notifyListeners();
  }

  Future <void> refreshTokens() async {

    Map <String, dynamic>? refreshResponse = await _authRepository.refreshAccessToken(
        userId!, refreshToken!
    );

    if (refreshResponse == null) {
      _changeState(isLoggedIn: isLoggedIn, isLoading: false);
    }

    else if (refreshResponse["status_code"] == 200) {
      await _writeValues(refreshResponse);
      _changeState(isLoading: false, isLoggedIn: true);
    }

    else if (refreshResponse["status_code"] != 200) {
      _changeState(isLoggedIn: false, isLoading: false);
    }

  }

  Future <void> _checkTokenAndRefresh() async {
    Map <String, dynamic>? checkTokenResponse = await _authRepository.checkAccessToken(accessToken!);

    if (checkTokenResponse == null) {
      _changeState(isLoggedIn: isLoggedIn, isLoading: false);
    }
    else if (checkTokenResponse["status_code"] == 200){
      _changeState(isLoggedIn: true, isLoading: false);
    }
    else if (checkTokenResponse["status_code"] == 401) {
      await refreshTokens();
    }
    else{
      _changeState(isLoggedIn: false, isLoading: false);
    }
  }

  Future <void> autoLogin() async {
    try {
      await _readStoredValues();

      if (userId == null || accessToken == null || refreshToken == null) {
        _changeState(isLoading: false, isLoggedIn: false);
        return;
      }

      await _checkTokenAndRefresh();
    } catch (e) {
      _changeState(isLoggedIn: false, isLoading: false);
    }
  }

  Future <void> login() async {
    _isLoading= true;

    try {
      String? idToken = await _authService.signIn();
      if (idToken == null) {
        _changeState(isLoggedIn: isLoggedIn, isLoading: false);
        return;
      }

      Map<String, dynamic>? response = await _authRepository.signInWithGoogle(idToken);

      if (response == null || response["status_code"] != 200){
        _changeState(isLoggedIn: false, isLoading: false);
        return;
      }

      await _writeValues(response);

      _changeState(isLoggedIn: false, isLoading: true);
    } catch (e) {
      _changeState(isLoggedIn: false, isLoading: false);
    }
  }
}