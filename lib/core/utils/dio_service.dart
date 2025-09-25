import 'package:conversehub/core/config/app_config.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl));
  Dio get dio => _dio;

  Future <Map<String, dynamic>?> post({
    required String path,
    required Map <String, dynamic> data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: headers
        )
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response.data;
      }
      else {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            print('POST $path error: Connection timeout');
            break;
          case DioExceptionType.sendTimeout:
            print('POST $path error: Send timeout');
            break;
          case DioExceptionType.receiveTimeout:
            print('POST $path error: Receive timeout');
            break;
          case DioExceptionType.cancel:
            print('POST $path error: Request cancelled');
            break;
          case DioExceptionType.unknown:
            print('POST $path error: Network error or socket exception');
            break;
          default:
            print('POST $path error: ${e.message}');
        }
      }
      return null;
    } catch (e) {
      print("Unexpected error on POST $path: $e");
      return null;
    }
  }


  Future <Map<String, dynamic>?> get({
    required String path,
    Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        options: Options(
          headers: headers
        )
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final response = e.response;
      if (response != null) {
        return response.data;
      }
      else {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            print('GET $path error: Connection timeout');
            break;
          case DioExceptionType.sendTimeout:
            print('GET $path error: Send timeout');
            break;
          case DioExceptionType.receiveTimeout:
            print('GET $path error: Receive timeout');
            break;
          case DioExceptionType.cancel:
            print('GET $path error: Request cancelled');
            break;
          case DioExceptionType.unknown:
            print('GET $path error: Network error or socket exception');
            break;
          default:
            print('GET $path error: ${e.message}');
        }
      }
      return null;
    } catch (e) {
      print("Unexpected error on GET $path: $e");
      return null;
    }
  }
}