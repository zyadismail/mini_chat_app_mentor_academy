import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/custom_textfield.dart';
import 'package:mini_chat_app_mentor_academy/features/profile/presentation/view/widgets/button_widget.dart';
import 'package:mini_chat_app_mentor_academy/features/profile/presentation/view/widgets/edit_profile.dart';

class ProfileViewBody extends StatelessWidget {
  ProfileViewBody({super.key});

  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        const EditPhoto(),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Name',
            style: Styles.textStyle10.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            hintText: 'enter your name',
            keyboardType: TextInputType.name,
            label: 'Name',
            controller: nameController,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Phone',
            style: Styles.textStyle10.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            hintText: 'enter your name',
            keyboardType: TextInputType.name,
            label: 'Name',
            controller: nameController,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const ButtonWidget(),
      ],
    );
  }
}
