import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/data/model/group_model.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/groups_view.dart';
import 'package:mini_chat_app_mentor_academy/features/profile/presentation/view/profile_view.dart';
 GroupModel? groupModel;
AppBar buildAppBar() => AppBar(
      elevation: 0.0,
      title: Text(
        'Whats App',
        style: Styles.textStyle24,
      ),
      actions: [
        const Icon(
          Icons.search,
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            // Handle menu item selection
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GroupsView(),
                    ),
                  );
                },
                value: "New Group",
                child: const Text(" Groups"),
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
    );
