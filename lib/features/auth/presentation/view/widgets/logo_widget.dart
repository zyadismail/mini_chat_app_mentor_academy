import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/constants/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        Assets.imagesLogo1,
        width: 300,
        height: 250,
      ),
    );
  }
}