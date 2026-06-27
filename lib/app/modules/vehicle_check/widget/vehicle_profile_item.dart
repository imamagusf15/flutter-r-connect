import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

class VehicleProfileItem extends StatelessWidget {
  final String label;
  final String iconAsset;
  const VehicleProfileItem({
    super.key,
    required this.label,
    required this.iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primary.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          CustomImageLocal(imagePath: iconAsset),
          Text(
            label,
            style: AppTextStyle.regular12(color: AppColors.netral400),
          ),
        ],
      ),
    );
  }
}
