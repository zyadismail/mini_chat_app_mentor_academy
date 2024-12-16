import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/model/auth_model.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/data/repos/group_repo.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/widgets/text_field.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController controller = TextEditingController();
  List<String> memebers = [];
  List myContact = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: memebers.isNotEmpty
          ? FloatingActionButton.extended(
              label: const Text("Done"),
              icon: const Icon(Iconsax.tick_circle),
              onPressed: () {
                GroupRepo().createGroup(
                  controller.text,
                  memebers,
                );
                Navigator.of(context).pop();
                setState(
                  () {
                    memebers = [];
                  },
                );
              },
            )
          : Container(),
      appBar: AppBar(
        title: const Text("Create Group"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                      ),
                      Positioned(
                        bottom: -15,
                        right: -13,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomField(
                    controller: controller,
                    icon: Iconsax.user_octagon,
                    lable: "Group name",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Text("Members"),
                Spacer(),
                Text("0"),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('members')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(), // study
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    myContact = snapshot.data!.data()![
                        'my_users']; 
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('members')
                          .where('uId',
                              whereIn: myContact.isEmpty ? [''] : myContact)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<UserModel> listItems = snapshot.data!.docs
                              .map((e) => UserModel.fromJson(e.data()))
                              .where((element) =>
                                      element.uId !=
                                      FirebaseAuth.instance.currentUser!
                                          .uid // we will see that again
                                  )
                              .toList();
                          return ListView.builder(
                            itemCount: listItems.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                checkboxShape: const CircleBorder(),
                                title: Text(listItems[index].name),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == true) {
                                      memebers.add(listItems[index].uId);
                                    } else {
                                      memebers.remove(listItems[index].uId);
                                    }
                                    // print(memebers);
                                  });
                                },
                                value: memebers.contains(listItems[index].uId),
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
