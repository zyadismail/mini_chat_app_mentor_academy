  import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';

AppBar appBar() => AppBar(
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
                const PopupMenuItem(
                  value: "New Group",
                  child: Text(" Groups"),
                ),
                const PopupMenuItem(
                  value: "New Broadcast",
                  child: Text("Profile"),
                ),
              ];
            },
          ),
        ],
      );