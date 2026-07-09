import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/extension/datetime_extension.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';
import 'package:flutter_rconnect/app/data/models/vehicle_crash_history.dart';

class HistoryCrashCard extends StatelessWidget {
  final VehicleCrashHistory crashInfo;

  const HistoryCrashCard({super.key, required this.crashInfo});

  @override
  Widget build(BuildContext context) {
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
              Text('Lokasi Kejadian', style: AppTextStyle.regular12()),
              Text(
                crashInfo.tglKejadian?.formatDate() ?? '-',
                style: AppTextStyle.regular12(),
              ),
            ],
          ),
          Text(crashInfo.lokasi ?? '-', style: AppTextStyle.semibold12()),
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
}
