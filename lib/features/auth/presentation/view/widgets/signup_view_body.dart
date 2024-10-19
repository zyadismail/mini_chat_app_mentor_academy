import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_button.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/password_fields.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/custom_textfield.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/have_an_account.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/logo_widget.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/title.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
var formKey = GlobalKey<FormState>();

class _SignUpViewBodyState extends State<SignUpViewBody> {
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
                  text: 'Register to new account',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  label: 'enter your name',
                  hintText: 'enter your name',
                  keyboardType: TextInputType.name,
                  prefix: const Icon(Icons.person),
                ),
                 const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  label: 'enter your email',
                  hintText: 'enter your email',
                  keyboardType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email),
                ),
                 const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: phoneController,
                  label: 'enter your phone',
                  hintText: 'enter your phone',
                  keyboardType: TextInputType.phone,
                  prefix: const Icon(Icons.phone_android),
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
                  text: 'Sign Up',
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