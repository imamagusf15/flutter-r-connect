import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  ApiConfig._();

  static Duration connectionTimeout = const Duration(seconds: 10);
  static Duration receiveTimeout = const Duration(seconds: 10);
  static Duration sendTimeout = const Duration(seconds: 10);

  static String baseUrl = dotenv.env['BASE_URL']!;
  static String authLogin = "/auth/login/v1/basic";
  static String authLogout = "/auth/logout/v1";
  static String getUser = "/user/v1/get_data_user";
  static String getVehicle = "/vehicle_check/v1/get_data_kendaraan";
  static String getVehicleHistory = "/vehicle_check/v1/get_history_sw";
}
