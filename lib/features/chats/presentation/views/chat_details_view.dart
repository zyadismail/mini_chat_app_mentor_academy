import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/build_app_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/chat_details_view_body.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ChatDetailsViewBody(),
    );
  }
}
