import 'dart:io';
import 'package:conversehub/core/utils/dio_service.dart';
import 'package:conversehub/core/utils/secure_storage_service.dart';
import 'package:conversehub/core/utils/shared_preferences_service.dart';
import 'package:conversehub/features/auth/application/auth_provider.dart';
import 'package:conversehub/features/auth/data/auth_repository.dart';
import 'package:conversehub/features/home/data/home_repository.dart';
import 'package:conversehub/features/home/domain/session_schema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final DioService _dioService = DioService();
final HomeRepository _homeRepository = HomeRepository(dio: _dioService);

class HomeProvider with ChangeNotifier{
  final AuthProvider _authProvider;

  HomeProvider({
    required authProvider
  }) : _authProvider = authProvider;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<SessionSchema>? _sessions;
  List<SessionSchema>? get sessions => _sessions;

  String? get firstName => _authProvider.firstName;

  String? _sessionName;
  String? get sessionName => _sessionName;

  String? _resumeName;
  String? get resumeName => _resumeName;
  String? _resumePath;
  String? get resumePath => _resumePath;

  String? _jobDescription;
  String? get jobDescription => _jobDescription;

  void updateSessionName(String newValue){
    _sessionName = newValue;
    notifyListeners();
  }

  void changeResume(String? newFileName, String? newFilePath) {
    _resumeName = newFileName;
    _resumePath = newFilePath;
    notifyListeners();
  }

  void updateJobDesc(String newValue){
    _jobDescription = newValue;
    notifyListeners();
  }

  void clearAll() {
    _sessionName = null;
    _jobDescription = null;
    _resumeName = null;
    _resumePath = null;
    notifyListeners();
  }

  Future <String> addSession(String mode) async {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic>? addSessionResponse = await _homeRepository.addSession(
      name: _sessionName!.trim(),
      mode: mode,
      resume: _resumePath == null ? null : File(_resumePath!),
      accessToken: _authProvider.accessToken,
      jobDescription: _jobDescription,
    );

    if (addSessionResponse?["status_code"] == 401) {
      await _authProvider.refreshTokens();
      addSessionResponse = await _homeRepository.addSession(
        name: _sessionName!,
        mode: mode,
        resume: _resumePath == null ? null : File(_resumePath!),
        accessToken: _authProvider.accessToken!,
        jobDescription: _jobDescription,
      );
    }

    _isLoading = false;
    notifyListeners();
    String message = "Error Occurred";
    if (addSessionResponse?["status_code"] == 200) {
      message = "Session Created";
      SessionSchema newSession = SessionSchema.fromMap(addSessionResponse?["data"]);
      _sessions?.insert(0, newSession);
    }
    else if (addSessionResponse?["status_code"] == 400) {
      message = "Session already exists with this name";
    }

    clearAll();
    return message;
  }

  Future <void> getSessions() async {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic>? getSessionsResponse = await _homeRepository.getSessions(
      accessToken: _authProvider.accessToken
    );

    if (getSessionsResponse?["status_code"] == 200) {
      final List<dynamic>? data = getSessionsResponse?["data"];

      List<SessionSchema>? newSessions = data
        ?.map((item) => SessionSchema.fromMap(item as Map<String, dynamic>))
        .toList();

      _sessions = newSessions;
    }
    else if (getSessionsResponse?["status_code"] == 401) {
      await _authProvider.refreshTokens();
      getSessionsResponse = await _homeRepository.getSessions(
        accessToken: _authProvider.accessToken
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  Future <void> deleteSession(String sessionId) async {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic>? deleteSessionResponse = await _homeRepository.deleteSession(
        sessionId: sessionId,
        accessToken: _authProvider.accessToken
    );

    if (deleteSessionResponse?["status_code"] == 401) {
      await _authProvider.refreshTokens();
      deleteSessionResponse = await _homeRepository.deleteSession(
        sessionId: sessionId,
        accessToken: _authProvider.accessToken
      );
    }

    if(deleteSessionResponse?["status_code"] == 200){
      await getSessions();
    }
    _isLoading = false;
    notifyListeners();
  }
}