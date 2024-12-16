import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/app_color.dart';
import 'package:mini_chat_app_mentor_academy/core/theme/styles.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_button.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/password_fields.dart';
import 'package:mini_chat_app_mentor_academy/core/widgets/custom_textfield.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/dont_have_an_account.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/logo_widget.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/title.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_chat_app_mentor_academy/features/home/presentation/view/home_view.dart';

class SigInViewBody extends StatefulWidget {
  const SigInViewBody({super.key});

  @override
  State<SigInViewBody> createState() => _SigInViewBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SigInViewBodyState extends State<SigInViewBody> {
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
                SizedBox(height: 15.h),
                const TitleWidget(
                  text: 'Login to your account',
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                  controller: emailController,
                  label: 'enter your email',
                  hintText: 'your email',
                  keyboardType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email),
                ),
                SizedBox(
                  height: 15.h,
                ),
                PasswrodFeild(
                  controller: passwordController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  color: AppColors.primaryColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Authenticate user using email and passwordController.text values
                      context.read<SignInCubit>().sigin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ),
                          (route) => false);
                    }
                  },
                  text: Text(
                    'Log In',
                    style: Styles.textStyle24,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const DontHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
