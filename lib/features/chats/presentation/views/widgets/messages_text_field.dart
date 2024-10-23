import 'package:flutter/material.dart';

class MessagesTextField extends StatelessWidget {
  const MessagesTextField({
    super.key,
    required TextEditingController messageController,
  }) : _messageController = messageController;

  final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: _messageController,
        decoration: const InputDecoration(
          filled: true,
          hintText: "Type your message...",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Don't enter empty message";
          }
          return null;
        },
      ),
    );
  }
}