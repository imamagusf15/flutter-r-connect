import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_button.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_textfield.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [AppColors.primary, AppColors.blue100],
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: 0, child: Image.asset(ConstantAsset.appLogo)),
            Positioned(
              top: 30,
              left: 0,
              child: Image.asset(ConstantAsset.cloud1),
            ),
            Positioned(
              top: 60,
              right: 0,
              child: Image.asset(ConstantAsset.cloud2),
            ),
            Positioned(
              top: 90,
              left: 0,
              child: Image.asset(ConstantAsset.cloud3),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                height: Get.height * 0.6,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      Text(
                        "Masuk",
                        style: AppTextStyle.semibold20(color: Colors.black),
                      ),
                      Text(
                        "Gunakan Username yang terdaftar untuk masuk.",
                        style: AppTextStyle.regular14(color: Colors.black),
                      ),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              title: 'Username',
                              controller: controller.usernameController,
                              validator: (value) {
                                if (value == '') {
                                  return 'Tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            Obx(
                              () => CustomTextFormField(
                                title: 'Password',
                                controller: controller.passwordController,
                                obscureText: !controller.isVisible.value,
                                sufficIcon: IconButton(
                                  onPressed: () =>
                                      controller.isVisible.toggle(),
                                  icon: Icon(
                                    controller.isVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => CustomButton(
                          onTap: controller.isLoading.value
                              ? null
                              : () => controller.login(),
                          width: Get.width,
                          isGradient: true,
                          child: controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text("Masuk", style: AppTextStyle.semibold14()),
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ada kendala atau butuh bantuan?',
                                style: AppTextStyle.regular16(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Hubungi Service Desk Divisi TIK',
                                style: AppTextStyle.semibold16(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(child: Text("Versi 3.2.44")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
