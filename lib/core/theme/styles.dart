import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static TextStyle textStyle24 =  TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600, 
  );
  static TextStyle textStyle10 =  TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600, 
  );
}