import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/constants/app_images.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_in_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(height: 300.h),
          Image.asset(
            Assets.imagesLogo1,
            width: 150.w,
            height: 150.h,
          ),
          Text(
            'WhatsApp',
            style: Styles.textStyle24,
          ),
          const Spacer(),
          Text(
            'The best Chat app of this century',
            style: Styles.textStyle10,
          ),
           SizedBox(
            height: 120.h,
          )
        ],
      ),
    );
  }

  void navigateToNextScreen() {
    Timer(
      const Duration(seconds: 3),
      () {
         Navigator.pushReplacementNamed(
            context,
            SigInView.loginView,
          );
      },
    );
  }
}
