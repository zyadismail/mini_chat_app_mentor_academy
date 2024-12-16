import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final String label;
  final Widget? prefix;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    required this.label,
    this.prefix,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        }
        return null; // y3ny mfysh ay moshkla
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        prefixIcon: prefix,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0.w),
        ),
      ),
    );
  }

  // OutlineInputBorder buildBorder() {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(4),
  //     borderSide: const BorderSide(width: 1, color: Color(0xffE6E9E9)),
  //   );
  // }
}
