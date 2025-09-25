import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  FlutterSecureStorage get storage => _storage;

  Future <String?> read(String key) async {
    try{
      return await _storage.read(key: key);
    } catch (e) {
      print("Error reading storage: $e");
      return null;
    }
  }

  Future <void> write(String key, String value) async {
    try{
      await _storage.write(key: key, value: value);
    } catch (e) {
      print("Error writing to storage: $e");
    }
  }

  Future <void> delete(String key) async {
    try{
      await _storage.delete(key: key);
    } catch (e) {
      print("Error deleting from storage: $e");
    }
  }

  Future <void> deleteAll() async {
    try{
      await _storage.deleteAll();
    } catch (e) {
      print("Error deleting all data: $e");
    }
  }
}