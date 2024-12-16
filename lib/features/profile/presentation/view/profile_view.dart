import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_in_view.dart';
import 'package:mini_chat_app_mentor_academy/features/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const profile = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(context, SigInView.loginView, (route) => false);
                // Logout logic goes here
              }),
        ],
        title: Text(
          'Profile',
          style: Styles.textStyle24,
        ),
      ),
      body: ProfileViewBody(),
    );
  }
}
