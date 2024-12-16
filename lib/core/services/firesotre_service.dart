import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_chat_app_mentor_academy/core/services/database_service.dart';

class FiresotreService implements DatabaseService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      fireStore.collection(path).doc(documentId).set(data);
    } else {
      await fireStore.collection(path).add(data);
      // mlhash lazma n7otha fy try w catch adam msh 3rfen goml el expections zy el auth
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await fireStore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }
}
