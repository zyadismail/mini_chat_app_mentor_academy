import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';

class RecentUpdates extends StatelessWidget {
  const RecentUpdates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 8.0),
        child: ListView.builder(
          itemCount: 5, // Replace with the number of status updates
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png',
                ),
              ),
              title: Text(
                'ziad ismail',
                style: Styles.textStyle24.copyWith(fontSize: 20),
              ),
              subtitle: Text(
                'Today, 12:00 PM',
                style: Styles.textStyle10.copyWith(
                  color: Colors.grey,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
