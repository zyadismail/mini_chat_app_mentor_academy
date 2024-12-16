import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/data/model/message_model.dart';
import 'package:uuid/uuid.dart';

class MessageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String myUid =
      FirebaseAuth.instance.currentUser!.uid;
  Future sendMessage(String uid, String msg, String roomsId,
      {String? type}) async {
    String msgId = const Uuid().v1();
    MessageModel messageModel = MessageModel(
      id: msgId,
      toId: uid,
      fromId: myUid,
      message: msg,
      type: type ?? 'text',
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
      read: '',
    );
    await _firestore
        .collection('rooms')
        .doc(roomsId)
        .collection('messages')
        .doc(msgId)
        .set(messageModel.toJson());
  }
}
