abstract class AppStorage {
  Future<bool> remove(String key);

  Future<bool> setValue(String key, dynamic value,
      [String Function(dynamic data)? encode]);

  T? getValue<T>(String key, [T Function(String json)? decode]);
}

class Keys {
  static const appUserToken = 'appUserToken';
}
