import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/chat_details_view.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>  ChatDetailsView(),
              ),
            );
          },
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          leading: const CircleAvatar(
            radius: 40,
          ),
          title: Text(
            'ziad',
            style: Styles.textStyle24.copyWith(
              fontSize: 20,
            ),
          ),
          subtitle: const Text(
            ' # 01153502010',
          ),
          trailing: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('12:00 PM'),
              SizedBox(
                height: 10,
              ),
              Badge(
                backgroundColor: AppColors.secondryColor,
                padding: EdgeInsets.symmetric(horizontal: 12),
                label: Text("2"),
                largeSize: 30,
              )
            ],
          ),
        );
      },
    );
  }
}
