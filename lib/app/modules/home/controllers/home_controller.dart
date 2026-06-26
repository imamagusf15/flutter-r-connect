import 'package:flutter_rconnect/app/common/session/session.dart';
import 'package:flutter_rconnect/app/common/session/session_manager.dart';
import 'package:flutter_rconnect/app/data/models/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _sessionManager = SessionManagerImpl();
  final Rx<User> userData = User().obs;

  final count = 0.obs;

  Future<void> readUserData() async {
    final data = _sessionManager.readMap(SessionKey.userData);
    if (data != null) {
      userData.value = User.fromJson(data);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await readUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
