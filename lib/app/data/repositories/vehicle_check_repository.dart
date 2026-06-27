import 'package:flutter_rconnect/app/common/config/api_config.dart';
import 'package:flutter_rconnect/app/data/helper/repository_helper.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_data.dart';
import 'package:fpdart/fpdart.dart';

abstract class VehicleCheckRepository {
  Future<Either<String, VehicleData>> getVehicleData({
    required String policeNumbers,
  });
  Future<Either<String, List<LastTransactionSwModel>>> getVehicleHistoryTax({
    required String policeNumbers,
  });
}

class VehicleCheckRepositoryImpl extends RepositoryHelper
    implements VehicleCheckRepository {
  @override
  Future<Either<String, VehicleData>> getVehicleData({
    required String policeNumbers,
  }) async {
    final dioCall = api.getRequest(
      ApiConfig.getVehicle,
      queryParameters: {'no_polisi': policeNumbers},
    );
    return callApi<VehicleData>(
      api: dioCall,
      jsonCallback: (json) => VehicleData.fromJson(json),
    );
  }

  @override
  Future<Either<String, List<LastTransactionSwModel>>> getVehicleHistoryTax({
    required String policeNumbers,
  }) {
    final dioCall = api.getRequest(
      ApiConfig.getVehicle,
      queryParameters: {'no_polisi': policeNumbers},
    );
    return callApiWithListData<LastTransactionSwModel>(
      api: dioCall,
      jsonCallback: (json) => LastTransactionSwModel.fromJson(json),
    );
  }
}
