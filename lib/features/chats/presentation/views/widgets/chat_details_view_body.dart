import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/messages_text_field.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/messgaes_listview.dart';

class ChatDetailsViewBody extends StatelessWidget {
  ChatDetailsViewBody({
    super.key,
  });

  final TextEditingController _messageController = TextEditingController();

  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MessagesListView(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _fromKey,
            child: Row(
              children: [
                MessagesTextField(messageController: _messageController),
                const SizedBox(
                  width: 15.0,
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      _messageController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Message must not be empty',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.send,
                    color: AppColors.secondryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
