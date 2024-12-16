import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/widgets/chat_view_body.dart';
import 'package:mini_chat_app_mentor_academy/features/profile/presentation/view/profile_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  static const chat = 'chat';

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
    bool isSearching = false;
  String searchQuery = '';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      title: !isSearching
          ? Text(
              'Whats App',
              style: Styles.textStyle24,
            )
          : TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              autofocus: true,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
      actions: [
        IconButton(
          icon: Icon(isSearching ? Icons.clear : Icons.search),
          onPressed: () {
            setState(() {
              if (isSearching) {
                searchController.clear();
                searchQuery = '';
              }
              isSearching = !isSearching;
            });
          },
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle menu item selection
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "New Group",
                child: Text("Groups"),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileView(),
                    ),
                  );
                },
                value: "New Broadcast",
                child: const Text("Profile"),
              ),
            ];
          },
        ),
      ],
    ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondryColor,
        child: const Icon(Icons.message),
        onPressed: () {},
      ),
      body:  ChatViewBody(
        searchQuery: searchQuery,
      ),
    );
  }
}
