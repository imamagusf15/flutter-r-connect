import 'package:flutter_rconnect/app/common/session/session.dart';
import 'package:get/get.dart';
import 'session_manager.dart';

/// Helper class untuk mengakses session data dengan mudah
class SessionHelper {
  static final SessionManager _session = Get.find<SessionManager>();

  // Get token
  static String? get token => _session.read(SessionKey.token);

  /// Clear all session data (logout)
  static Future<void> clearSession() async {
    await _session.clearAll();
  }
}
