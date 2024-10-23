import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/build_app_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  static const chat = 'chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: AppColors.secondryColor,
        child: const Icon(Icons.message),
        onPressed: (){

      }),
      body: const ChatViewBody(),
    );
  }
}
