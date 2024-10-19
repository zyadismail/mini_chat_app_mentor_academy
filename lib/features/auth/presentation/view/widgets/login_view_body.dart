import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_button.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/password_fields.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/custom_textfield.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/dont_have_an_account.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/logo_widget.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/title.dart';

class SigInViewBody extends StatefulWidget {
  const SigInViewBody({super.key});

  @override
  State<SigInViewBody> createState() => _SigInViewBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _SigInViewBodyState extends State<SigInViewBody> {
  bool? isPasswordVisible;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 15),
                const TitleWidget(
                  text: 'Login to your account',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  label: 'enter your email',
                  hintText: 'your email',
                  keyboardType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 15,
                ),
                PasswrodFeild(
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Authenticate user using email and passwordController.text values
                    } else {
                      // Show error message if form is not valid
                    }
                  },
                  text: 'Log In',
                ),
                const SizedBox(height:30,),
                const HaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
