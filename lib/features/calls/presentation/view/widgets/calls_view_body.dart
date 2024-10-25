import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';

class CallsViewBody extends StatelessWidget {
  const CallsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Text(
            'Recent',
            style: Styles.textStyle10.copyWith(color: Colors.grey),
          ),
        ),
        Expanded(
            child: ListView.separated(
            separatorBuilder: (context, index) {
            return  const SizedBox(height: 10,);
            },
          itemCount: 10,
          itemBuilder: (context, indeex) {
            return  ListTile(
              leading: const CircleAvatar(
                radius: 30,
              ),
              title: Text(
                'ziad',
                style: Styles.textStyle24.copyWith(fontSize: 20),
              ),
              subtitle: const Text('Today, 10:30 AM'),
              trailing: const Icon(Icons.call),
            );
          },
        )),
      ],
    );
  }
}