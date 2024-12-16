import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60.h,
        width: 350.w,
        child: CustomButton(
          color: AppColors.secondryColor,
          onPressed: () {},
          text:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.save,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              const Text(
                'Save Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}