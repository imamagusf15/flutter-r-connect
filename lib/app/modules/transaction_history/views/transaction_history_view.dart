import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/common/widgets/history_crash_card.dart';
import 'package:flutter_rconnect/app/common/widgets/history_iw_card.dart';
import 'package:flutter_rconnect/app/common/widgets/history_sw_card.dart';
import 'package:flutter_rconnect/app/core/enum.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_sw_model.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_crash_history.dart';
import 'package:get/get.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_button.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Kendaraan'),
        centerTitle: true,
        titleTextStyle: AppTextStyle.semibold18(color: Colors.white),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            Obx(() {
              if (controller.historyType.value == HistoryType.sw) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(
                      'Riwayat Transaksi SWDKLLJ',
                      style: AppTextStyle.semibold16(
                        color: AppColors.netral500,
                      ),
                    ),
                    Text(
                      'Menampilkan data pembayaran terakhir',
                      style: AppTextStyle.regular12(color: AppColors.netral500),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.red50,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.red100,
                            ),
                            child: CustomImageLocal(
                              imagePath: ConstantAsset.warningIcon,
                              color: AppColors.red400,
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Terlambat',
                                style: AppTextStyle.semibold12(
                                  color: AppColors.netral500,
                                ),
                              ),
                              Text(
                                'Masa Berlaku s.d -' /*${swTransaction.masaLakuAkhir!.formatDate()}*/,
                                style: AppTextStyle.regular12(
                                  color: AppColors.netral500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (controller.historyType.value == HistoryType.iw) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(
                      'Riwayat Transaksi IWKBU',
                      style: AppTextStyle.semibold16(
                        color: AppColors.netral500,
                      ),
                    ),
                    Text(
                      'Menampilkan data pembayaran terakhir',
                      style: AppTextStyle.regular12(color: AppColors.netral500),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade100,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green.shade200,
                            ),
                            child: CustomImageLocal(
                              imagePath: ConstantAsset.warningIcon,
                              color: Colors.green.shade700,
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Aktif',
                                style: AppTextStyle.semibold12(
                                  color: AppColors.netral500,
                                ),
                              ),
                              Text(
                                'Masa Berlaku s.d -' /*${iwTransaction.masaLakuAkhir?.formatDate() ?? '-'}*/,
                                style: AppTextStyle.regular12(
                                  color: AppColors.netral500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(
                      'Kecelakaan',
                      style: AppTextStyle.semibold16(
                        color: AppColors.netral500,
                      ),
                    ),
                    Text(
                      'Menampilkan data kejadian terakhir',
                      style: AppTextStyle.regular12(color: AppColors.netral500),
                    ),
                  ],
                );
              }
            }),
            Obx(() {
              if (controller.historyType.value == HistoryType.sw) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2 /*controller.swTransactions.length*/,
                  itemBuilder: (context, index) {
                    if (controller.swTransactions.isEmpty) {
                      return HistorySwCard(
                        transaction: LastTransactionSwModel(),
                      );
                    } else {
                      final item = controller.swTransactions[index];
                      return HistorySwCard(transaction: item);
                    }
                  },
                );
              } else if (controller.historyType.value == HistoryType.iw) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2 /*controller.iwTransactions.length*/,
                  itemBuilder: (context, index) {
                    if (controller.iwTransactions.isEmpty) {
                      return HistoryIwCard(
                        transaction: LastTransactionIwModel(),
                      );
                    } else {
                      final item = controller.iwTransactions[index];
                      return HistoryIwCard(transaction: item);
                    }
                  },
                );
              } else if (controller.historyType.value == HistoryType.crash) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2 /*controller.crashHistories.length*/,
                  itemBuilder: (context, index) {
                    if (controller.crashHistories.isEmpty) {
                      return HistoryCrashCard(crashInfo: VehicleCrashHistory());
                    } else {
                      final item = controller.crashHistories[index];
                      return HistoryCrashCard(crashInfo: item);
                    }
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),

            const SizedBox(height: 10),
            CustomButton(
              onTap: () => Navigator.of(context).pop(),
              backgroundColor: AppColors.white,
              child: Text(
                'Kembali',
                style: AppTextStyle.semibold16(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
