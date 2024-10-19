
import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';

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
            text: 'Dont have an account?',
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
            // recognizer: TapGestureRecognizer() //studyyyyyyyy
            //   ..onTap = () {
            //     Navigator.of(context).pushNamed(SignupView.routeName);
            //   },
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
