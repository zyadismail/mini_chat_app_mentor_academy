import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/custom_textfield.dart';

class PasswrodFeild extends StatefulWidget {
  const PasswrodFeild({
    super.key, required this.controller,
  });
   final TextEditingController controller;

  @override
  State<PasswrodFeild> createState() => _PasswrodFeildState();
}

class _PasswrodFeildState extends State<PasswrodFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: obscureText,
      hintText: 'enter your password',
      keyboardType: TextInputType.visiblePassword,
      prefix:const Icon(Icons.lock) ,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText; // lw b true tb2a b false
          setState(() {});
        },
        child: obscureText
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.visibility_off),
      ),
      label: 'enter your password',
      controller: widget.controller,
    );
  }
}
