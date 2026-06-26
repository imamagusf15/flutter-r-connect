import 'package:get/get.dart';

import '../controllers/vehicle_check_controller.dart';

class VehicleCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleCheckController>(
      () => VehicleCheckController(),
    );
  }
}
