import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';

abstract class Styles {
  static TextStyle textStyle24 = const TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w600, 
  );
  static TextStyle textStyle10 = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 15,
    fontWeight: FontWeight.w600, 
  );
}