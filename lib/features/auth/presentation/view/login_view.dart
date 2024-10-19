import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/login_view_body.dart';

class SigInView extends StatelessWidget {
  const SigInView({super.key});

static const loginView = 'login';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SigInViewBody(),
    );
  }
}
