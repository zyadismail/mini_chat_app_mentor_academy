import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/data/model/group_model.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/widgets/group_view_body.dart';

class GroupCard extends StatelessWidget {
  final GroupModel chatGroup;
  const GroupCard({
    super.key,
    required this.chatGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  GroupViewBody(
              chatGroup: chatGroup,
            ),
          ),
        ),
        leading: CircleAvatar(
          child: Text(chatGroup.name.characters.first), // newwwww studyyyy
        ),
        title: Text(chatGroup.name),
        subtitle: Text(
          chatGroup.lastMessage == ""
              ? "send first meessage"
              : chatGroup.lastMessage,
        ),
        trailing: Text(
          DateFormat.yMMMEd().format(
            DateTime.fromMillisecondsSinceEpoch(
              int.parse(chatGroup.lastMessageTime),
            ),
          ),
        ),
      ),
    );
  }
}



// const Badge(
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             label: Text("3"),
//             largeSize: 30,
//           )),
