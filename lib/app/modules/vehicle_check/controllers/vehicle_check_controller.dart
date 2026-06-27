import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_sw_model.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_crash_history.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_data.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_model.dart';
import 'package:flutter_rconnect/app/data/repositories/vehicle_check_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VehicleCheckController extends GetxController {
  final prefixController = TextEditingController();
  final textController = TextEditingController();
  final suffixController = TextEditingController();
  final _vehicleCheckRepo = VehicleCheckRepositoryImpl();

  final vehicleData = Rxn<VehicleData>();

  final selectedIndex = 0.obs;
  final visibleNIK = false.obs;
  final visibleHP = false.obs;
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();

  final List<String> identifierOptions = [
    'Nomor Polisi',
    'Nomor Rangka',
    'Nomor Mesin',
  ];

  Future<void> fetchVehicleData() async {
    vehicleData.value = null;
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        final formattedText =
            '${prefixController.text}-${textController.text}-${suffixController.text}';
        final result = await _vehicleCheckRepo.getVehicleData(
          policeNumbers: formattedText,
        );

        result.fold((l) => Get.snackbar('Failed!', l), (data) {
          vehicleData.value = data;
        });
      } catch (e) {
        Get.snackbar('Failed!', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    prefixController.dispose();
    textController.dispose();
    suffixController.dispose();
    super.onClose();
  }

  void selectIndex(int index) {
    selectedIndex.value = index;
    prefixController.clear();
    textController.clear();
    suffixController.clear();
  }
}
