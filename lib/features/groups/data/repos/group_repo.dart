import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/data/model/group_model.dart';
import 'package:uuid/uuid.dart';

class GroupRepo{
  final String myUid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    createGroup(String name, List memebers) async {
    String groupId = const Uuid().v1();
    memebers.add(myUid);
    GroupModel groupModel = GroupModel(
      id: groupId,
      name: name,
      image: "",
      members: memebers,
      adminsId: [myUid],
      lastMessage: "",
      lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    await firebaseFirestore
        .collection('groups')
        .doc(groupId)
        .set(groupModel.toJson());
  }


}