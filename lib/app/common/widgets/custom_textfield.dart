import 'package:flutter/material.dart';
import 'package:flutter_rconnect/app/core/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? sufficIcon;
  final bool? autofocus;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.title,
    this.hintText,
    this.obscureText,
    this.validator,
    this.prefixIcon,
    this.sufficIcon,
    this.autofocus,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title!, style: AppTextStyle.semibold14(color: Colors.black)),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          autofocus: autofocus ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: sufficIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ],
    );
  }
}
