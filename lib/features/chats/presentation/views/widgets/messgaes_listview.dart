import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/data/model/message_model.dart';

class MessagesListView extends StatefulWidget {
  final String roomId;
  final UserModel chatUser;
  const MessagesListView({
    super.key,
    required this.roomId,
    required this.chatUser,
  });

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("rooms")
              .doc(widget.roomId)
              .collection('messages')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MessageModel> messageItems = snapshot.data!.docs
                  .map((e) => MessageModel.fromJson(e.data()))
                  .toList()
                ..sort(
                  (a, b) {
                    return a.createdAt!.compareTo(b.createdAt!);
                  },
                );

              return ListView.separated(
                itemBuilder: (context, index) {
                  bool isMe = messageItems[index].fromId ==
                      FirebaseAuth.instance.currentUser!.uid;
                  return BubbleSpecialThree(
                    text: messageItems[index].message!,
                    color: isMe ? AppColors.secondryColor : Colors.black54,
                    tail: false,
                    isSender: isMe,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: messageItems.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
