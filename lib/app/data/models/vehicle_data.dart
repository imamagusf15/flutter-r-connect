import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_sw_model.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_crash_history.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_model.dart';

class VehicleData {
  Vehicle? vehicle;
  LastTransactionIwModel? lastTransactionIwModel;
  LastTransactionSwModel? lastTransactionSwModel;
  VehicleCrashHistory? vehicleCrashHistory;

  VehicleData({
    required this.vehicle,
    required this.lastTransactionIwModel,
    required this.lastTransactionSwModel,
    required this.vehicleCrashHistory,
  });

  VehicleData.fromJson(Map<String, dynamic> json) {
    vehicle = Vehicle.fromJson(json);
    lastTransactionIwModel = LastTransactionIwModel.fromJson(json);
    lastTransactionSwModel = LastTransactionSwModel.fromJson(json);
    vehicleCrashHistory = VehicleCrashHistory.fromJson(json);
  }
}
