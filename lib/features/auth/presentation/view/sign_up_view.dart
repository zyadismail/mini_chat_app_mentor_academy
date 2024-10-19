import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/signup_view_body.dart';

class SigUpView extends StatelessWidget {
  const SigUpView({super.key});

  static const signUp = 'signUp';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpViewBody(),
    );
  }
}



