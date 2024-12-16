import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/helper/build_error_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/signin_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigInView extends StatelessWidget {
  const SigInView({super.key});

  static const loginView = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('SignIn Success'),
              ),
            );
          }
          if (state is SignInError) {
            buildErrorBar(context, state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SignInLoading ? true : false,
            child: const SigInViewBody(),
          );
        },
      ),
    );
  }
}
