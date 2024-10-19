import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textStyle24,
      textAlign: TextAlign.center,
    );
  }
}
