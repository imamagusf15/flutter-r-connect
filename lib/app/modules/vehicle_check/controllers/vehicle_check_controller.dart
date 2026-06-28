import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_data.dart';
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
    if (formKey.currentState!.validate()) {
      String? errorMessage;
      try {
        isLoading.value = true;

        final formattedText =
            '${prefixController.text}-${textController.text}-${suffixController.text}';
        final result = await _vehicleCheckRepo.getVehicleData(
          policeNumbers: formattedText,
        );

        result.fold(
          (l) {
            isLoading.value = false;
            errorMessage = l.toString();
          },
          (data) {
            vehicleData.value = data;
          },
        );
      } catch (e) {
        errorMessage = e.toString();
      } finally {
        isLoading.value = false;
      }

      if (errorMessage != null) {
        Get.snackbar('Failed!', errorMessage ?? '');
      }
    }
  }

  void showDialogInfo() {}

  @override
  void onReady() {
    super.onReady();
    ever(isLoading, (callback) {
      if (callback) {
        Get.dialog(
          Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.white),
            ),
          ),
        );
      } else {
        Get.back();
      }
    });
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
