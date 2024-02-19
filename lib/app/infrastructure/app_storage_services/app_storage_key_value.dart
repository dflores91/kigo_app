import 'package:injectable/injectable.dart';
import 'package:kigo_app/app/domain/storage/app_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AppStorage)
class AppStorageKeyValue implements AppStorage {
  const AppStorageKeyValue(this._preferences);

  final SharedPreferences _preferences;

  @override
  T? getValue<T>(String key, [T Function(String json)? decode]) {
    try {
      if (decode != null) {
        final json = _preferences.getString(key);
        return json != null ? decode(json) : null;
      }

      final value = _preferences.get(key) as T?;

      return value;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> setValue(String key, value,
      [String Function(dynamic data)? encode]) {
    if (encode != null) {
      return _preferences.setString(key, encode(value));
    }

    switch (value.runtimeType) {
      case double:
        return _preferences.setDouble(key, value);
      case bool:
        return _preferences.setBool(key, value);
      case String:
        return _preferences.setString(key, value);
      case int:
        return _preferences.setInt(key, value);
      default:
        throw Exception(
            'The setter for ${value.runtimeType} is not implemented');
    }
  }
}
