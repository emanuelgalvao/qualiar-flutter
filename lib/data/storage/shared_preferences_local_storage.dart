import 'package:air_pollution_app/data/storage/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage extends ILocalStorage {
  @override
  Future delete(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }

  @override
  Future get(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  @override
  Future put(String key, value) async {
    final preferences = await SharedPreferences.getInstance();
    if (value is String) {
      return preferences.setString(key, value);
    } else {
      throw UnimplementedError();
    }
  }
  
}