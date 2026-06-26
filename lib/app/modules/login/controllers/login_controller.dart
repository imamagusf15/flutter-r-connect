import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/session/session.dart';
import 'package:flutter_rconnect/app/common/session/session_manager.dart';
import 'package:flutter_rconnect/app/data/repositories/auth_repository.dart';
import 'package:flutter_rconnect/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _authRepository = AuthRepositoryImpl();
  final _sessionManager = SessionManagerImpl();

  final isVisible = false.obs;
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        final result = await _authRepository.loginUser(
          username: usernameController.text,
          password: passwordController.text,
        );

        await result.fold(
          (message) async {
            Get.snackbar("Failed", message);
          },
          (token) async {
            print(token);
            if (token.isNotEmpty) {
              await _sessionManager.write(SessionKey.token, token);
              print('Token saved: $token');
            }
            Get.toNamed(Routes.HOME);
            // TODO: Pindahkan _fetchUserData ke HomeBinding atau HomeView
            await _fetchUserData();
          },
        );
      } catch (e) {
        Get.snackbar("Failed!", e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> _fetchUserData() async {
    final result = await _authRepository.getUserData();

    result.fold(
      (message) {
        Get.snackbar("Failed", message);
      },
      (data) async {
        await _sessionManager.writeMap(SessionKey.userData, data.toJson());

        Get.offNamed(Routes.HOME);
        Get.snackbar('Success', 'Login Success');
      },
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
