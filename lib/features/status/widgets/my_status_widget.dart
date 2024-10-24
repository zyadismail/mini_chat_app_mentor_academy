import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';

class MyStatusWidget extends StatelessWidget {
  const MyStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 40,
        backgroundImage:  NetworkImage(
            'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png'),
      ),
      title: Text(
        'My Status',
        style: Styles.textStyle24.copyWith(fontSize: 20),
      ),
      subtitle: const Text('Tap to add status update'),
    );
  }
}