import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_button.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        width: 350,
        child: CustomButton(
          color: AppColors.secondryColor,
          onPressed: () {},
          text: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.save,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Save Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}