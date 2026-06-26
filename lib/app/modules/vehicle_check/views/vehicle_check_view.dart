import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_button.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_textfield.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

import '../controllers/vehicle_check_controller.dart';

class VehicleCheckView extends GetView<VehicleCheckController> {
  const VehicleCheckView({super.key});

  Widget _buildIdentifierTab(
    BuildContext context,
    String label,
    bool selected,
    VoidCallback onTap,
  ) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100, maxWidth: 160),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.netral200,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.18),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyle.semibold14(
              color: selected ? AppColors.white : AppColors.netral700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleInputField({
    TextEditingController? controller,
    required String hintText,
    bool small = false,
  }) {
    return Container(
      height: small ? 48 : 58,
      decoration: BoxDecoration(
        color: AppColors.blue50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.netral200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          isDense: true,
        ),
        style: AppTextStyle.semibold16(color: AppColors.netral900),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    bool isHidden = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: AppColors.netral500),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTextStyle.regular14(color: AppColors.netral700),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              isHidden ? '••••••••••••••' : value,
              style: AppTextStyle.semibold14(color: AppColors.primary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),
          if (isHidden) ...[
            const SizedBox(width: 8),
            Icon(Icons.visibility_off, size: 18, color: AppColors.netral500),
          ],
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.blue100.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTextStyle.semibold14(color: AppColors.primary),
      ),
    );
  }

  Widget _buildPaymentRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyle.regular14(color: AppColors.netral700),
          ),
          Text(
            value,
            style: AppTextStyle.semibold14(color: AppColors.netral900),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentStat(String value, String label) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppTextStyle.semibold16(color: AppColors.netral900),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppTextStyle.regular12(color: AppColors.netral500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue50,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profil Kendaraan',
          style: AppTextStyle.semibold18(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primary, AppColors.blue100],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Masukkan ID Kendaraan',
                    style: AppTextStyle.semibold20(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Menu ini berfungsi untuk pengecekan data kendaraan & riwayat pembayaran SWDKLLJ dan IWKBU. Data ini hanya untuk keperluan pekerjaan dan tidak untuk disebarluaskan.',
                    style: AppTextStyle.regular14(
                      color: AppColors.white.withOpacity(0.92),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Pilih & Input Identifier Kendaraan',
                    style: AppTextStyle.semibold14(color: AppColors.white),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24),
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
                        Obx(
                          () => Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(
                              controller.identifierOptions.length,
                              (index) => _buildIdentifierTab(
                                context,
                                controller.identifierOptions[index],
                                controller.selectedIndex.value == index,
                                () => controller.selectIndex(index),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildVehicleInputField(
                                controller: controller.textController,
                                hintText: '1234 ABC',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  _buildVehicleInputField(
                                    hintText: 'B',
                                    small: true,
                                  ),
                                  const SizedBox(height: 10),
                                  _buildVehicleInputField(
                                    hintText: 'CD',
                                    small: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onTap: () {},
                          isGradient: true,
                          child: Text(
                            'Cari Data',
                            style: AppTextStyle.semibold16(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                    'Profil Kendaraan',
                    style: AppTextStyle.semibold18(color: AppColors.netral900),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'B-7205-BGA',
                    style: AppTextStyle.semibold20(color: AppColors.primary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'PT. SERLIAN JAYA UTAMA',
                    style: AppTextStyle.semibold16(color: AppColors.netral900),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildTag('2022'),
                      const SizedBox(width: 10),
                      _buildTag('6374 CC'),
                      const SizedBox(width: 10),
                      _buildTag('Silver Kombinasi'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 0),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    Icons.settings,
                    'No. Rangka',
                    'MHL368006DJ002603',
                  ),
                  const Divider(height: 0),
                  _buildInfoRow(Icons.memory, 'No. Mesin', '906998U1029093'),
                  const Divider(height: 0),
                  _buildInfoRow(Icons.fire_truck, 'Jenis Kendaraan', 'E3'),
                  const Divider(height: 0),
                  _buildInfoRow(
                    Icons.badge,
                    'NIK',
                    '****************',
                    isHidden: true,
                  ),
                  const Divider(height: 0),
                  _buildInfoRow(
                    Icons.phone,
                    'No. HP',
                    '************',
                    isHidden: true,
                  ),
                  const Divider(height: 0),
                  _buildInfoRow(
                    Icons.location_on,
                    'Alamat',
                    'Jl. Perserikatan No1 Blok A/261 JT',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                    'SWDKLLJ',
                    style: AppTextStyle.semibold18(color: AppColors.netral900),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Menampilkan data pembayaran terakhir',
                    style: AppTextStyle.regular12(color: AppColors.netral500),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.red50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.red300.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Terlambat',
                              style: AppTextStyle.semibold14(
                                color: AppColors.red900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Masa Berlaku s.d. 02 November 2024',
                              style: AppTextStyle.regular12(
                                color: AppColors.red900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.primary, AppColors.blue100],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
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
                                      '0200003 - SAMSAT JAKARTA UTARA',
                                      style: AppTextStyle.semibold14(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '22 Agustus 2024',
                                style: AppTextStyle.semibold14(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    size: 18,
                                    color: AppColors.netral500,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Tgl. Penetapan',
                                      style: AppTextStyle.regular14(
                                        color: AppColors.netral700,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '22 Agustus 2024',
                                    style: AppTextStyle.semibold14(
                                      color: AppColors.netral900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    size: 18,
                                    color: AppColors.netral500,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      'Masa Berlaku',
                                      style: AppTextStyle.regular14(
                                        color: AppColors.netral700,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '02 November 2024',
                                        style: AppTextStyle.semibold14(
                                          color: AppColors.netral900,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        's.d. 02 November 2025',
                                        style: AppTextStyle.regular12(
                                          color: AppColors.netral500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Divider(height: 0),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildPaymentStat('3.000', 'KD'),
                                  _buildPaymentStat('87.000', 'SW'),
                                  _buildPaymentStat('87.000', 'Denda'),
                                  _buildPaymentStat('117.000', 'Total'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Riwayat Transaksi',
                          style: AppTextStyle.semibold14(
                            color: AppColors.primary,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                    'IWKBU',
                    style: AppTextStyle.semibold18(color: AppColors.netral900),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Menampilkan data pembayaran terakhir',
                    style: AppTextStyle.regular12(color: AppColors.netral500),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aktif',
                              style: AppTextStyle.semibold14(
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Masa Berlaku s.d. 02 November 2025',
                              style: AppTextStyle.regular12(
                                color: AppColors.netral700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.primary, AppColors.blue100],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
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
                                      '0200003 - SAMSAT JAKARTA UTARA',
                                      style: AppTextStyle.semibold14(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '22 Agustus 2025',
                                style: AppTextStyle.semibold14(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildPaymentRow('Status', 'Beroperasi'),
                              const Divider(height: 0),
                              _buildPaymentRow(
                                'Kode & Nama PO',
                                '02002116 - Gabungan Perorangan Samsat Utara',
                              ),
                              const Divider(height: 0),
                              _buildPaymentRow(
                                'Masa Berlaku',
                                '02 November 2024 - s.d. 02 November 2025',
                              ),
                              const SizedBox(height: 16),
                              const Divider(height: 0),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildPaymentStat('85.000', 'Tarif'),
                                  _buildPaymentStat('48', 'Seat'),
                                  _buildPaymentStat('1.275.000', 'Total'),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'No. Resi : RP.KBU.09.297147',
                                style: AppTextStyle.regular12(
                                  color: AppColors.netral500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.TRANSACTION_HISTORY),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Riwayat Transaksi',
                          style: AppTextStyle.semibold14(
                            color: AppColors.primary,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                    'Kecelakaan',
                    style: AppTextStyle.semibold18(color: AppColors.netral900),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Menampilkan data kejadian terakhir',
                    style: AppTextStyle.regular12(color: AppColors.netral500),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.primary, AppColors.blue100],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lokasi Kejadian',
                                      style: AppTextStyle.regular12(
                                        color: AppColors.white.withOpacity(0.8),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Pamekasan, Madura, Jawa Timur',
                                      style: AppTextStyle.semibold14(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '07 Februari 2024',
                                style: AppTextStyle.semibold14(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildPaymentRow(
                                'Laporan Kepolisian',
                                'LP/6/II/2024/LL',
                              ),
                              const Divider(height: 0),
                              _buildPaymentRow('Pengemudi', 'M. Najib'),
                              const Divider(height: 0),
                              _buildPaymentRow(
                                'Total Santunan',
                                'Rp 145.000.000',
                              ),
                              const Divider(height: 0),
                              _buildPaymentRow('Berkas Santunan', '2 Berkas'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Riwayat Kejadian',
                          style: AppTextStyle.semibold14(
                            color: AppColors.primary,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
