import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/extension/datetime_extension.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_button.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';
import 'package:flutter_rconnect/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'label': 'Santunan Online', 'icon': ConstantAsset.santunanImg},
      {'label': 'Verifikasi IWKBU', 'icon': ConstantAsset.verificationImg},
      {'label': 'Transaksi IWKBU', 'icon': ConstantAsset.transactionImg},
      {'label': 'Penugasan DTD/CRM', 'icon': ConstantAsset.crmImg},
      {'label': 'Survey Prabayar', 'icon': ConstantAsset.surverImg},
      {'label': 'Survey Pascabayar', 'icon': ConstantAsset.surveyImg},
      {'label': 'Bantuan', 'icon': ConstantAsset.bantuanImg},
      {'label': 'Lihat Semua', 'icon': ConstantAsset.allserviceImg},
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: AlignmentGeometry.center,
            colors: [AppColors.primary, AppColors.primary, AppColors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.VEHICLE_CHECK),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            ConstantAsset.profilePicture,
                            fit: BoxFit.cover,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        controller.userData.value.name ?? 'Unknown',
                        style: AppTextStyle.semibold20(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageLocal(
                      imagePath: ConstantAsset.roleIcon,
                      width: 16,
                      height: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Kepala Kantor Pelayanan JR Tingkat II Bandung',
                        style: AppTextStyle.regular12(color: AppColors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.blue100],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.18),
                        blurRadius: 24,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.all(4),
                        child: Row(
                          children: [
                            CustomImageLocal(
                              imagePath: ConstantAsset.dateContainer,
                            ),
                            SizedBox(width: 8),
                            Text(
                              DateTime.now().formatDate(),
                              style: AppTextStyle.regular14(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(17),
                        ),
                        // height: 192,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Regular Office [08:00 - 17:00]',
                                    style: AppTextStyle.regular12(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Riwayat Kehadiran',
                                    style: AppTextStyle.semibold12(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        ConstantAsset.profilePicture,
                                        fit: BoxFit.cover,
                                        width: 56,
                                        height: 56,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '08:00',
                                        style: AppTextStyle.bold28(
                                          color: AppColors.netral900,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: Colors.green.shade100,
                                        ),
                                        child: Text(
                                          'Jam Masuk',
                                          style: AppTextStyle.regular12(
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 56,
                                    color: Colors.grey.shade300,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.grey.shade100,
                                    child: ClipOval(
                                      child: Icon(
                                        Icons.person_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '--:--',
                                        style: AppTextStyle.bold28(
                                          color: AppColors.netral100,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: Colors.grey.shade100,
                                        ),
                                        child: Text(
                                          'Jam Keluar',
                                          style: AppTextStyle.regular12(
                                            color: AppColors.netral300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            CustomButton(
                              onTap: () {},
                              isGradient: true,
                              child: Text(
                                'Rekam Waktu',
                                style: AppTextStyle.semibold14(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: GridView.builder(
                    itemCount: menuItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: _buildMenuCard(item['icon']!, item['label']!),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(String iconPath, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.netral50.withOpacity(0.2),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.blue100.withOpacity(0.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: Image.asset(iconPath, fit: BoxFit.cover)),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.regular12(color: AppColors.netral900),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
