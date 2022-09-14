
import 'package:shared_preferences/shared_preferences.dart';

 class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void save({required String uId}) {
    _sharedPreferences.setString('uId', uId);
  }
  void saveBool({required bool boolean,required String key}) {
    _sharedPreferences.setBool(key, boolean);
  }

/*  void changeLanguage({required String langCode}) {
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }*/

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  void clear() async {
    _sharedPreferences.clear();
  }

// String get language =>
//     _sharedPreferences.getString(PrefKeys.language.name) ?? 'en';
//
// bool get loggedIn =>
//     _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;
}