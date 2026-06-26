import 'dart:convert';

import 'package:get_storage/get_storage.dart';

abstract class SessionManager {
  Future<void> write(String key, String value);

  String? read(String key);

  // Map operations
  Future<void> writeMap(String key, Map<String, dynamic> value);

  Map<String, dynamic>? readMap(String key);

  Future<void> remove(String key);

  Future<void> clearAll();
}

class SessionManagerImpl extends SessionManager {
  final _box = GetStorage(base64.encode("session".codeUnits));

  @override
  String? read(String key) {
    try {
      var result = base64.decode(_box.read(key));
      return utf8.decode(result);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    return await _box.write(key, base64.encode(value.codeUnits));
  }

  @override
  Future<void> writeMap(String key, Map<String, dynamic> value) async {
    final jsonString = jsonEncode(value);
    return await _box.write(key, base64.encode(jsonString.codeUnits));
  }

  @override
  Map<String, dynamic>? readMap(String key) {
    try {
      final encoded = _box.read(key);
      if (encoded == null) return null;

      final decoded = base64.decode(encoded);
      final jsonString = utf8.decode(decoded);
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearAll() async {
    return await _box.erase();
  }

  @override
  Future<void> remove(String key) async {
    return await _box.remove(key);
  }
}
