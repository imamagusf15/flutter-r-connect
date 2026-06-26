import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VehicleCheckController extends GetxController {
  final selectedIndex = 0.obs;
  final prefixController = TextEditingController();
  final textController = TextEditingController();
  final suffixController = TextEditingController();

  final List<String> identifierOptions = [
    'Nomor Polisi',
    'Nomor Rangka',
    'Nomor Mesin',
  ];

  String get activePlaceholder => identifierOptions[selectedIndex.value];

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
