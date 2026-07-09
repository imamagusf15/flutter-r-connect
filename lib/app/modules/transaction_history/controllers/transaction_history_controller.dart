import 'package:flutter_rconnect/app/core/enum.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_sw_model.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_crash_history.dart';
import 'package:flutter_rconnect/app/data/repositories/vehicle_check_repository.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController {
  final _vehicleCheckRrepo = VehicleCheckRepositoryImpl();

  final swTransactions = RxList<LastTransactionSwModel>();
  final iwTransactions = RxList<LastTransactionIwModel>();
  final crashHistories = RxList<VehicleCrashHistory>();

  final historyType = Rx<HistoryType>(HistoryType.sw);
  final policeNumbers = ''.obs;
  final count = 0.obs;
  final isLoading = false.obs;

  Future<void> fetchTransactionHistory() async {
    String? errorMessage;
    try {
      isLoading.value = true;

      final result = await _vehicleCheckRrepo.getVehicleHistoryTax(
        policeNumbers: policeNumbers.value,
      );

      result.fold(
        (message) {
          errorMessage = message;
        },
        (data) {
          swTransactions.assignAll(data);
        },
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading.value = false;
    }

    if (errorMessage != null) {
      Get.snackbar('Failed!', errorMessage!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      historyType.value = Get.arguments as HistoryType;
    }
  }
}
