import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app_mentor_academy/core/helper/build_error_bar.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/widgets/signup_view_body.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigUpView extends StatelessWidget {
  const SigUpView({super.key});

  static const signUp = 'signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('SignUp Success'),
              ),
            );
          }
          if (state is SignUpError) {
            buildErrorBar(context, state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is SignUpLoading,
            child: const SignUpViewBody());
        },
      ),
    );
  }
}
