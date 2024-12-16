import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/data/repos/message_repo.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/messages_text_field.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/messgaes_listview.dart';

class ChatDetailsViewBody extends StatefulWidget {
  final String roomId;
  final UserModel chatUser;
  const ChatDetailsViewBody({
    super.key,
    required this.roomId,
    required this.chatUser,
  });

  @override
  State<ChatDetailsViewBody> createState() => _ChatDetailsViewBodyState();
}

class _ChatDetailsViewBodyState extends State<ChatDetailsViewBody> {
  final TextEditingController _messageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MessagesListView(
          chatUser: widget.chatUser,
          roomId: widget.roomId,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                MessagesTextField(messageController: _messageController),
                SizedBox(
                  width: 15.0.w,
                ),
                FloatingActionButton(
                  onPressed: () {
                    MessageRepository().sendMessage(
                      widget.chatUser.uId,
                      _messageController.text,
                      widget.roomId,
                    );
                    _messageController.clear();
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



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
// import 'package:mini_chat_app_mentor_academy/features/chats/data/model/message_model.dart';
// import 'package:mini_chat_app_mentor_academy/features/chats/presentation/view_model/message_cubit/message_cubit.dart';
// import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/messages_text_field.dart';
// import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/messgaes_listview.dart';

// class ChatDetailsViewBody extends StatefulWidget {
//   final String senderId;
//   final String receiverId;

//   const ChatDetailsViewBody({
//     super.key,
//     required this.senderId,
//     required this.receiverId,
//   });

//   @override
//   State<ChatDetailsViewBody> createState() => _ChatDetailsViewBodyState();
// }

// class _ChatDetailsViewBodyState extends State<ChatDetailsViewBody> {
//   final TextEditingController _messageController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   void _sendMessage(BuildContext context) {
//     if (_formKey.currentState?.validate() ?? false) {
//       final content = _messageController.text.trim();
//       final message = Message(
//         id: UniqueKey().toString(), // Unique ID for the message
//         senderId: widget.senderId,
//         // receiverId: widget.receiverId,
//         content: content,
//         timestamp: DateTime.now(),
//       );
//       context.read<MessageCubit>().sendMessage(message);
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: MessagesListView(
//             receiverId: widget.receiverId,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Form(
//             key: _formKey,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: MessagesTextField(
//                     messageController: _messageController,
//                   ),
//                 ),
//                 SizedBox(width: 15.0.w),
//                 FloatingActionButton(
//                   onPressed: () => _sendMessage(context),
//                   child: const Icon(
//                     Icons.send,
//                     color: AppColors.secondryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
