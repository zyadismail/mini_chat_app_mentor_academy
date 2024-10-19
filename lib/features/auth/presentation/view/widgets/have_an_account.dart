
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_in_view.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'have an account?',
            style: Styles.textStyle24.copyWith(
              fontSize: 15,
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
                Navigator.of(context).pushNamed(SigInView.loginView);
              },
            text: 'Login here',
            style:
                Styles.textStyle10,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
