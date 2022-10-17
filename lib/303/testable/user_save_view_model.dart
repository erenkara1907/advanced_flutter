import 'package:shared_preferences/shared_preferences.dart';

class UserSaveViewModel {
  bool getReadData(String key, IStore preferences) {
    final response = preferences.getString(key);
    return response;
  }
}

abstract class IStore {
  bool getString(String key);
}

class SharedPrefStore extends IStore {
  SharedPrefStore(this.preferences);
  final SharedPreferences preferences;

  @override
  bool getString(String key) {
    final response = preferences.getString(key);
    if (response?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}

class MockStore extends IStore {
  @override
  bool getString(String key) {
    return false;
  }
}
