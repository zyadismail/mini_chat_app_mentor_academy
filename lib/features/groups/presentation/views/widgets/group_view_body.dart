import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/data/model/group_model.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/widgets/group_card.dart';

class GroupViewBody extends StatefulWidget {

     GroupModel? chatGroup;
   GroupViewBody({super.key,  this.chatGroup});

  @override
  State<GroupViewBody> createState() => _GroupViewBodyState();
}

class _GroupViewBodyState extends State<GroupViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('groups')
                      .where('members',
                          arrayContains: FirebaseAuth.instance.currentUser!
                              .uid) // study array contains
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<GroupModel> groups = snapshot.data!.docs
                          .map((e) => GroupModel.fromJson(e.data()))
                          .toList()..sort((a, b) {
                            return b.lastMessageTime.compareTo(a.lastMessageTime);
                          },);
                      return ListView.builder(
                        itemCount:groups.length,
                        itemBuilder: (context, index) {
                          return  GroupCard(
                            chatGroup: groups[index],
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      );
  }
}