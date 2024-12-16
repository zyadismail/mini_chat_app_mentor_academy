import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_button.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/password_fields.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_textfield.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/have_an_account.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/logo_widget.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/title.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
var formKey1 = GlobalKey<FormState>();

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: formKey1,
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
                  controller: nameController,
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
                  color: AppColors.primaryColor,
                  onPressed: () {
                    if (formKey1.currentState!.validate()) {
                      // Authenticate user using email and passwordController.text values
                      context.read<SignUpCubit>().sigUp(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            phone: phoneController.text,
                          );
                    } else {
                      // Show error message if form is not valid
                    }
                  },
                  text: Text(
                    'Sign Up',
                    style: Styles.textStyle24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const HaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
