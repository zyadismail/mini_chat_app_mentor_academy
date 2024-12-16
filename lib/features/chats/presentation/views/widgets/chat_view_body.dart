import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/chat_details_view.dart';

class ChatViewBody extends StatelessWidget {
  final String searchQuery;
  const ChatViewBody({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('members').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching users'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No users available'));
          }
          // List<QueryDocumentSnapshot<Object?>> users =
          //     checkCurrentUser(snapshot, currentUser);
          List<QueryDocumentSnapshot<Object?>> users =
              filterUsers(snapshot, currentUser);

          if (users.isEmpty) {
            return const Center(child: Text('No users found'));
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index].data() as Map<String, dynamic>;
              final userName = user['name'] ?? "Unknown";
              final phone = user['phoneNumber'] ?? "No Phone";
              final email = user['email'] ?? "No email";
              final receiverId = user['uId'] ?? '';
              final chatUser = UserModel(
                uId: receiverId,
                name: userName,
                phoneNumber: phone,
                email: email,
              );

              final roomId = generateRoomId(currentUser!.uid, receiverId);

              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatDetailsView(
                        chatUser: chatUser,
                        roomId: roomId,
                      ),
                    ),
                  );
                },
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                leading: const CircleAvatar(
                  radius: 40,
                ),
                title: Text(
                  userName,
                  style: Styles.textStyle24.copyWith(
                    fontSize: 20.sp,
                  ),
                ),
                subtitle: Text(
                  ' # $phone',
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('12:00 PM'),
                    SizedBox(
                      height: 5.h,
                    ),
                    Badge(
                      backgroundColor: AppColors.secondryColor,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      label: const Text("2"),
                      largeSize: 30.h,
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  List<QueryDocumentSnapshot<Object?>> filterUsers(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, User? currentUser) {
    final users = snapshot.data!.docs.where((doc) {
      final user = doc.data() as Map<String, dynamic>;
      final name = user['name'] ?? '';
      final userId = user['uId'];

      return userId != currentUser!.uid &&
          name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    return users;
  }

  String generateRoomId(String senderId, String receiverId) {
    return senderId.compareTo(receiverId) < 0
        ? "$senderId-$receiverId"
        : "$receiverId-$senderId";
  }
  // List<QueryDocumentSnapshot<Object?>> checkCurrentUser(
  //     AsyncSnapshot<QuerySnapshot<Object?>> snapshot, User? currentUser) {
  //   final users = snapshot.data!.docs.where((doc) {
  //     final user = doc.data() as Map<String, dynamic>;
  //     // Check if the current user's ID matches the user ID in Firestore
  //     return user['uId'] != currentUser?.uid;
  //   }).toList();
  //   return users;
  // }
}
