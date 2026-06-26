import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_button.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  const TransactionHistoryView({super.key});

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.check_circle, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktif',
                  style: AppTextStyle.semibold16(color: AppColors.primary),
                ),
                const SizedBox(height: 4),
                Text(
                  'Masa Berlaku s.d. 02 November 2025',
                  style: AppTextStyle.regular14(color: AppColors.netral700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(
    String label,
    String value, {
    bool isBlueValue = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyle.regular14(color: AppColors.netral700),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style: AppTextStyle.semibold14(
              color: isBlueValue ? AppColors.primary : AppColors.netral900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard({
    required String date,
    required String office,
    required String status,
    required String poCode,
    required String validityStart,
    required String validityEnd,
    required String tarif,
    required String seat,
    required String total,
    required String receipt,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.blue100],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loket Kantor',
                        style: AppTextStyle.regular12(
                          color: AppColors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        office,
                        style: AppTextStyle.semibold14(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyle.semibold14(color: AppColors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTransactionRow('Status', status, isBlueValue: true),
                const Divider(height: 0),
                _buildTransactionRow(
                  'Kode & Nama PO',
                  poCode,
                  isBlueValue: true,
                ),
                const Divider(height: 0),
                _buildTransactionRow(
                  'Masa Berlaku',
                  '$validityStart\n s.d. $validityEnd',
                  isBlueValue: true,
                ),
                const SizedBox(height: 16),
                const Divider(height: 0),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tarif,
                            style: AppTextStyle.semibold16(
                              color: AppColors.netral900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Tarif',
                            style: AppTextStyle.regular12(
                              color: AppColors.netral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            seat,
                            style: AppTextStyle.semibold16(
                              color: AppColors.netral900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Seat',
                            style: AppTextStyle.regular12(
                              color: AppColors.netral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            total,
                            style: AppTextStyle.semibold16(
                              color: AppColors.netral900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Total',
                            style: AppTextStyle.regular12(
                              color: AppColors.netral500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'No. Resi : $receipt',
                  style: AppTextStyle.regular12(color: AppColors.netral500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.netral900.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Riwayat Transaksi IWKBU',
                      style: AppTextStyle.semibold18(
                        color: AppColors.netral900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Menampilkan data pembayaran terakhir',
                      style: AppTextStyle.regular12(color: AppColors.netral500),
                    ),
                    const SizedBox(height: 16),
                    _buildStatusCard(),
                    const SizedBox(height: 16),
                    Text(
                      'Data Diurutkan dari transaksi terbaru hingga transaksi pertama',
                      style: AppTextStyle.regular12(color: AppColors.netral500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTransactionCard(
                date: '22 Agustus 2025',
                office: '0200003 - SAMSAT JAKARTA UTARA',
                status: 'BEROPERASI',
                poCode: '02002116 - GABUNGAN PERORANGAN SAMSAT UTARA',
                validityStart: '02 November 2024',
                validityEnd: '02 November 2025',
                tarif: '85.000',
                seat: '48',
                total: '1.275.000',
                receipt: 'RP.KBU.09.297147',
              ),
              _buildTransactionCard(
                date: '22 Agustus 2025',
                office: '0200003 - SAMSAT JAKARTA UTARA',
                status: 'ARMADA BARU',
                poCode: '02002116 - GABUNGAN PERORANGAN SAMSAT UTARA',
                validityStart: '22 Agustus 2025',
                validityEnd: '22 Agustus 2025',
                tarif: '85.000',
                seat: '0',
                total: '85.000',
                receipt: 'RP.KBU.09.297147',
              ),
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
      ),
    );
  }
}
