import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/core/app_color.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? isGradient;
  final double? height;
  final double? width;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.textColor,
    this.backgroundColor,
    this.isGradient,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor,
            gradient: isGradient != null
                ? LinearGradient(colors: [AppColors.primary, AppColors.blue100])
                : null,
          ),
          height: height ?? 44,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
