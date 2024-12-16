import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/widgets/create_group.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/widgets/group_view_body.dart';
import 'package:iconsax/iconsax.dart';

class GroupsView extends StatelessWidget {
   const GroupsView({super.key,  });
      static const group = 'group';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CreateGroup()));
        },
        child: const Icon(Iconsax.message_add1),
      ),
      appBar: AppBar(
        title: const Text("Groups Screen"),
      ),
      body:  GroupViewBody(),
    );
  }
}






class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




