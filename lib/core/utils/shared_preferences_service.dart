import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> write(String key, String value) async {
    try{
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (e) {
      print("Error saving to shared prefs: $e");
    }
  }

  Future<String?> read(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      print("Error reading from shared prefs: $e");
      return null;
    }
  }

  Future<void> delete(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } catch (e) {
      print("Error deleting from shared prefs: $e");
    }
  }

  Future <void> deleteALl() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
