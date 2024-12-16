import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/build_app_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/chat_details_view_body.dart';

class ChatDetailsView extends StatelessWidget {
  final String roomId;
  final UserModel chatUser;
  const ChatDetailsView(
      {super.key,
      required this.roomId,
      required this.chatUser,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:  ChatDetailsViewBody(
        chatUser: chatUser,
        roomId: roomId,
      ),
    );
  }
}
