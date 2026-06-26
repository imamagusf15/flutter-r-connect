import 'dart:convert';

class SessionKey {
  static String token = base64.encode("token".codeUnits);
  static String userData = base64.encode("userData".codeUnits);
}
