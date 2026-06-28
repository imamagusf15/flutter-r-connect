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
    this.vehicle,
    this.lastTransactionIwModel,
    this.lastTransactionSwModel,
    this.vehicleCrashHistory,
  });

  VehicleData.fromJson(Map<String, dynamic> json) {
    vehicle = Vehicle.fromJson(json['data_kendaraan']);
    lastTransactionIwModel = json['last_transaction_iw'] != null
        ? LastTransactionIwModel.fromJson(json['last_transaction_iw'])
        : null;
    lastTransactionSwModel = json['last_transaction_sw'] != null
        ? LastTransactionSwModel.fromJson(json['last_transaction_sw'])
        : null;
    vehicleCrashHistory = json['last_history_laka'] != null
        ? VehicleCrashHistory.fromJson(json['last_history_laka'])
        : null;
  }
}
