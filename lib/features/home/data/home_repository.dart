import 'dart:io';

import 'package:conversehub/features/home/domain/session_schema.dart';
import 'package:dio/dio.dart';

import '../../../core/utils/dio_service.dart';

class HomeRepository{
  final DioService _dio;
  HomeRepository({required DioService dio}) : _dio = dio;

  Future <Map<String, dynamic>?> addSession(
      {required String name,
        required String mode,
        File? resume,
        String? jobDescription,
        String? accessToken}) async
  {

    Map <String, dynamic> data = {
      'session_name' : name,
      'mode' : mode
    };

    if (resume != null) {
      MultipartFile? resumeFormData = await MultipartFile.fromFile(
          resume.path,
          filename: resume.uri.pathSegments.last
      );
      data["resume"] = resumeFormData;
    }

    if (jobDescription != null){
      data["job_description"] = jobDescription;
    }

    final FormData formData = FormData.fromMap(data);

    try{
      Map<String, dynamic>? response = await _dio.post(
          path: "/api/conversation/session",
          data: formData,
          headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $accessToken',
          }
      );

      return response;
    } catch (e) {
      print("Add Session Failed : $e");
      return {"Error": e};
    }
  }

  Future <Map<String, dynamic>?> getSessions(
      {
        int limit = 10,
        int offset = 0,
        String? accessToken
      }) async
  {

    try{
      Map<String, dynamic>? response = await _dio.get(
          path: "/api/conversation/sessions?limit=$limit&offset=$offset",
          headers: {
            'Authorization': 'Bearer $accessToken',
          }
      );

      return response;
    } catch (e) {
      print("Add Session Failed : $e");
      return {"Error": e};
    }
  }

  Future <Map<String, dynamic>?> deleteSession(
  {
    required String sessionId,
    String? accessToken,
  }
  ) async {
    try{
      Map<String, dynamic>? response = await _dio.delete(
          path: "/api/conversation/session",
          data: {
            'session_id': sessionId
          },
          headers: {
            'Authorization': 'Bearer $accessToken',
          }
      );

      return response;
    } catch (e) {
      print("Delete Session Failed : $e");
      return {"Error": e};
    }
  }

}