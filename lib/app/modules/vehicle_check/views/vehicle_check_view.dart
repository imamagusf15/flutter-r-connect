import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/extension/datetime_extension.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_textfield.dart';
import 'package:flutter_rconnect/app/core/app_string.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_iw_model.dart';
import 'package:flutter_rconnect/app/data/models/last_transaction_sw_model.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_crash_history.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_model.dart';
import 'package:flutter_rconnect/app/modules/vehicle_check/widget/identifier_item.dart';
import 'package:flutter_rconnect/app/modules/vehicle_check/widget/vehicle_profile_item.dart';
import 'package:flutter_rconnect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_button.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

import '../controllers/vehicle_check_controller.dart';

class VehicleCheckView extends GetView<VehicleCheckController> {
  const VehicleCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.center,
            colors: [AppColors.primary, AppColors.primary, AppColors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      'Profil Kendaraan',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.semibold14(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 24,
                    children: [
                      _buildCheckVehicleCard(),
                      Obx(() {
                        final vehicleData = controller.vehicleData.value;
                        return vehicleData != null
                            ? Column(
                                children: [
                                  _buildVehicleProfileCard(
                                    vehicleData.vehicle!,
                                  ),
                                  _buildTransactionSW(
                                    vehicleData.lastTransactionSwModel ??
                                        LastTransactionSwModel(),
                                  ),
                                  _buildTransactionIW(
                                    vehicleData.lastTransactionIwModel ??
                                        LastTransactionIwModel(),
                                  ),
                                  _buildCrashInfoCard(
                                    vehicleData.vehicleCrashHistory ??
                                        VehicleCrashHistory(),
                                  ),
                                ],
                              )
                            : SizedBox.shrink();
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCheckVehicleCard() {
    final identifierData = [
      IdentifierData(label: 'Nomor Polisi', imageIcon: ConstantAsset.nopolIcon),
      IdentifierData(
        label: 'Nomor Rangka',
        imageIcon: ConstantAsset.wrenchIcon,
      ),
      IdentifierData(label: 'Nomor Mesin', imageIcon: ConstantAsset.gearIcon),
    ];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.center,
          colors: [AppColors.blue100.withOpacity(0.5), AppColors.blue50],
        ),
      ),
      child: Column(
        spacing: 4,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 8,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.blue100,
                  ),
                  child: Image.asset(ConstantAsset.nopolImg),
                ),
                Text('Masukkan ID Kendaraan', style: AppTextStyle.semibold16()),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade50,
            ),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.checkVehicleInfo,
                  textAlign: TextAlign.justify,
                  style: AppTextStyle.regular12(color: AppColors.netral400),
                ),
                SizedBox(height: 2),
                Text(
                  'Pilih & Input Identifier Kendaraan',
                  style: AppTextStyle.semibold12(color: AppColors.netral400),
                ),
                SizedBox(
                  height: 72,
                  width: Get.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: identifierData.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 4),
                    itemBuilder: (context, index) {
                      final data = identifierData[index];
                      return Obx(
                        () => IdentifierItem(
                          onTap: () => controller.selectIndex(index),
                          data: data,
                          isSelected: controller.selectedIndex.value == index,
                        ),
                      );
                    },
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Row(
                    spacing: 4,
                    children: [
                      SizedBox(
                        width: 75,
                        child: CustomTextFormField(
                          controller: controller.prefixController,
                          textAlign: TextAlign.center,
                          hintText: 'B',
                          validator: (value) {
                            if (value == '') {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          controller: controller.textController,
                          textAlign: TextAlign.center,
                          hintText: '1234',
                          validator: (value) {
                            if (value == '') {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        child: CustomTextFormField(
                          controller: controller.suffixController,
                          textAlign: TextAlign.center,
                          hintText: 'BGA',
                          validator: (value) {
                            if (value == '') {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onTap: () {
                    controller.fetchVehicleData();
                  },
                  isGradient: true,
                  child: Text('Cari Data', style: AppTextStyle.semibold14()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card _buildVehicleProfileCard(Vehicle vehicle) {
    final profilItems = [
      _buildRowInfo(
        iconAsset: ConstantAsset.wrenchIcon,
        label: 'No. Rangka',
        value: vehicle.noRangka ?? '',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.gearIcon,
        label: 'No. Mesin',
        value: vehicle.noMesin ?? '',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.carIcon,
        label: 'Jenis Kendaraan',
        value: vehicle.jenis ?? '',
      ),
      Obx(
        () => _buildRowInfo(
          iconAsset: ConstantAsset.cardIcon,
          label: 'NIK',
          value: vehicle.nik ?? '',
          visibleValue: controller.visibleNIK.value,
          onPressed: () => controller.visibleNIK.toggle(),
        ),
      ),
      Obx(
        () => _buildRowInfo(
          iconAsset: ConstantAsset.phoneIcon,
          label: 'No. HP',
          value: vehicle.noHp ?? '',
          visibleValue: controller.visibleHP.value,
          onPressed: () => controller.visibleHP.toggle(),
        ),
      ),

      _buildRowInfo(
        iconAsset: ConstantAsset.locationIcon,
        label: 'Alamat',
        value: vehicle.alamat ?? '',
      ),
    ];
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profil Kendaraan',
              style: AppTextStyle.semibold16(color: AppColors.netral400),
            ),
            Divider(),
            Text(
              vehicle.noPolisi ?? '',
              style: AppTextStyle.bold12(color: AppColors.netral200),
            ),
            Text(
              vehicle.namaPemilik ?? '',
              style: AppTextStyle.semibold20(color: AppColors.netral500),
            ),
            Wrap(
              runSpacing: 4,
              spacing: 4,
              children: [
                VehicleProfileItem(
                  label: vehicle.tahun ?? '',
                  iconAsset: ConstantAsset.calendarIcon,
                ),
                VehicleProfileItem(
                  label: '${vehicle.cc} CC',
                  iconAsset: ConstantAsset.speedIcon,
                ),
                VehicleProfileItem(
                  label: vehicle.warna ?? '',
                  iconAsset: ConstantAsset.palletIcon,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: profilItems.length,
                itemBuilder: (context, index) {
                  return profilItems[index];
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _buildTransactionSW(LastTransactionSwModel swTransaction) {
    final item = [
      _buildRowInfo(
        iconAsset: ConstantAsset.calendarIcon,
        label: 'Tgl. Penetapan',
        value: swTransaction.tglTransaksi?.formatDate() ?? '',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.calendarIcon,
        label: 'Masa Berlaku',
        value:
            '${swTransaction.masaLakuAwal!.formatDate()} s.d ${swTransaction.masaLakuAkhir!.formatDate()}',
      ),
      _buildRowPriceTotal([
        {
          'label': 'KD',
          'value': swTransaction.kd,
          'textColor': AppColors.netral500,
        },
        {
          'label': 'SW',
          'value': swTransaction.sw,
          'textColor': AppColors.netral500,
        },
        {
          'label': 'Denda',
          'value': swTransaction.denda,
          'textColor': AppColors.netral500,
        },
        {
          'label': 'Total',
          'value': swTransaction.total,
          'textColor': AppColors.primary,
        },
      ]),
    ];

    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SWDKLLJ',
              style: AppTextStyle.semibold16(color: AppColors.netral500),
            ),
            Text(
              'Menampilkan data pembayaran terakhir',
              style: AppTextStyle.regular12(color: AppColors.netral500),
            ),
            Divider(),
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
                        'Masa Berlaku s.d ${swTransaction.masaLakuAkhir!.formatDate()}',
                        style: AppTextStyle.regular12(
                          color: AppColors.netral500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildInfoCard(
              item,
              placeTitle: 'Loket Kantor',
              placeName: swTransaction.loketKantor ?? '',
              date: swTransaction.tglTransaksi?.formatDate() ?? '',
            ),
            Divider(),
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                iconAlignment: IconAlignment.end,
                label: Text(
                  'Riwayat Transaksi',
                  style: AppTextStyle.semibold12(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card _buildTransactionIW(LastTransactionIwModel iwTransaction) {
    final item = [
      _buildRowInfo(
        iconAsset: ConstantAsset.calendarIcon,
        label: 'Status',
        value: iwTransaction.status ?? '-',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.officeIcon,
        label: 'Kode & Nama PO',
        value: '${iwTransaction.kodePo ?? ''} - ${iwTransaction.namaPo ?? '-'}',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.calendarIcon,
        label: 'Masa Berlaku',
        value: iwTransaction.masaLakuAwal != null
            ? '${iwTransaction.masaLakuAwal!.formatDate()} & ${iwTransaction.masaLakuAkhir!.formatDate()}'
            : '-',
      ),
      _buildRowPriceTotal([
        {
          'label': 'Tarif',
          'value': iwTransaction.tarif ?? '-',
          'textColor': AppColors.netral500,
        },
        {
          'label': 'Seat',
          'value': iwTransaction.seat ?? '-',
          'textColor': AppColors.netral500,
        },
        {
          'label': 'Total',
          'value': iwTransaction.total ?? '-',
          'textColor': AppColors.primary,
        },
      ]),
      Align(
        alignment: AlignmentGeometry.center,
        child: Text(
          'No. Resi : ${iwTransaction.noResi ?? '-'}',
          style: AppTextStyle.regular12(color: AppColors.netral300),
        ),
      ),
    ];

    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              'IWKBU',
              style: AppTextStyle.semibold16(color: AppColors.netral500),
            ),
            Text(
              'Menampilkan data pembayaran terakhir',
              style: AppTextStyle.regular12(color: AppColors.netral500),
            ),
            Divider(),
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
                        'Masa Berlaku s.d ${iwTransaction.masaLakuAkhir?.formatDate() ?? '-'}',
                        style: AppTextStyle.regular12(
                          color: AppColors.netral500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            _buildInfoCard(
              item,
              placeTitle: 'Loket Kantor',
              placeName: iwTransaction.loketKantor ?? '-',
              date: iwTransaction.tglTransaksi?.formatDate() ?? '-',
            ),
            Divider(),
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton.icon(
                onPressed: () => Get.toNamed(Routes.TRANSACTION_HISTORY),
                icon: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                iconAlignment: IconAlignment.end,
                label: Text(
                  'Riwayat Transaksi',
                  style: AppTextStyle.semibold12(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCrashInfoCard(VehicleCrashHistory crashInfo) {
    final item = [
      _buildRowInfo(
        iconAsset: ConstantAsset.documentIcon,
        label: 'Laporan Kepolisian',
        value: crashInfo.noLp ?? '-',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.driverIcon,
        label: 'Pengemudi',
        value: crashInfo.pengemudi ?? '-',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.handIcon,
        label: 'Total Santunan',
        value: 'Rp ${crashInfo.totalSantunan ?? '0'}',
      ),
      _buildRowInfo(
        iconAsset: ConstantAsset.doubleFileIcon,
        label: 'Berkas Santunan',
        value: crashInfo.noBerkas ?? '-',
      ),
    ];
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kecelakaan',
              style: AppTextStyle.semibold16(color: AppColors.netral500),
            ),
            Text(
              'Menampilkan data kejadian terakhir',
              style: AppTextStyle.regular12(color: AppColors.netral500),
            ),
            Divider(),

            _buildInfoCard(
              item,
              placeTitle: 'Lokasi Kejadian',
              placeName: crashInfo.lokasi ?? '-',
              date: crashInfo.tglKejadian?.formatDate() ?? '-',
            ),
            Divider(),
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
                iconAlignment: IconAlignment.end,
                label: Text(
                  'Riwayat Kejadian',
                  style: AppTextStyle.semibold12(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRowInfo({
    required String iconAsset,
    required String label,
    required String value,
    bool? visibleValue,
    VoidCallback? onPressed,
  }) {
    return Row(
      children: [
        CustomImageLocal(imagePath: iconAsset),
        SizedBox(width: 4),
        Text(label, style: AppTextStyle.regular12(color: AppColors.netral500)),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            visibleValue != null
                ? visibleValue == true
                      ? value
                      : '****************'
                : value,
            style: AppTextStyle.semibold12(color: AppColors.primary),
            textAlign: TextAlign.right,
            maxLines: 2,
          ),
        ),
        if (visibleValue != null)
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              color: AppColors.primary,
              visibleValue
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
      ],
    );
  }

  Widget _buildInfoCard(
    List<Widget> item, {
    required String placeTitle,
    required String placeName,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.center,
          colors: [AppColors.primary, AppColors.white],
        ),
      ),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(placeTitle, style: AppTextStyle.regular12()),
              Text(date, style: AppTextStyle.regular12()),
            ],
          ),
          Text(placeName, style: AppTextStyle.semibold12()),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.netral50,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: item.length,
              itemBuilder: (context, index) => item[index],
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowPriceTotal(List<Map<String, dynamic>> items) {
    return Container(
      width: Get.width,
      height: 50,
      alignment: Alignment.center,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),

        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            VerticalDivider(indent: 10, endIndent: 10, width: 20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${item['value']}',
                style: AppTextStyle.bold12(color: item['textColor']),
              ),
              Text(
                item['label'],
                style: AppTextStyle.regular12(color: item['textColor']),
              ),
            ],
          );
        },
      ),
    );
  }
}
