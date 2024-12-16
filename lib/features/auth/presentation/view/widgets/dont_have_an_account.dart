
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_up_view.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Dont have an account?',
            style: Styles.textStyle24.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: ' ',
            style: Styles.textStyle10
          ),
          TextSpan(
            recognizer: TapGestureRecognizer() //studyyyyyyyy
              ..onTap = () {
                Navigator.of(context).pushNamed(SigUpView.signUp);
              },
            text: 'Register',
            style:
                Styles.textStyle10,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
