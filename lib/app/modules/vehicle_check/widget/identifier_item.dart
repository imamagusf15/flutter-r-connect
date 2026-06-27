import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/common/constant/constant_asset.dart';
import 'package:flutter_rconnect/app/common/widgets/custom_image_local.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

class IdentifierData {
  final String label;
  final String imageIcon;

  IdentifierData({required this.label, required this.imageIcon});
}

class IdentifierItem extends StatelessWidget {
  final IdentifierData data;
  final VoidCallback onTap;
  final bool isSelected;
  const IdentifierItem({
    super.key,
    required this.onTap,
    required this.data,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.netral100,
          ),
          color: isSelected
              ? AppColors.primary.withOpacity(0.2)
              : AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Container(
              height: 28,
              width: 28,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : AppColors.netral100,
                borderRadius: BorderRadius.circular(50),
              ),
              child: CustomImageLocal(
                imagePath: data.imageIcon,
                color: isSelected ? AppColors.primary : AppColors.netral500,
              ),
            ),
            Text(
              data.label,
              style: AppTextStyle.regular12(
                color: isSelected ? AppColors.primary : AppColors.netral300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
