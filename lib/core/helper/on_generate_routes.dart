import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat_app_mentor_academy/core/services/service_locator.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/data/repos/auth_repo.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_in_view.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_up_view.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:mini_chat_app_mentor_academy/features/calls/presentation/view/calls_view.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/chat_view.dart';
import 'package:mini_chat_app_mentor_academy/features/groups/presentation/views/groups_view.dart';
import 'package:mini_chat_app_mentor_academy/features/home/presentation/view/home_view.dart';
import 'package:mini_chat_app_mentor_academy/features/profile/presentation/view/profile_view.dart';
import 'package:mini_chat_app_mentor_academy/features/splash/presentation/views/splash_view.dart';
import 'package:mini_chat_app_mentor_academy/features/status/status_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.splashView:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
    case SigInView.loginView:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SignInCubit(
            getIt<AuthRepo>(),
          ),
          child: const SigInView(),
        ),
      );
    case SigUpView.signUp:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SignUpCubit(
            getIt<AuthRepo>(),
          ),
          child: const SigUpView(),
        ),
      );
    case HomeView.home:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    case ChatView.chat:
      return MaterialPageRoute(
        builder: (context) => const ChatView(),
      );
    case StatusView.status:
      return MaterialPageRoute(
        builder: (context) => const StatusView(),
      );
    case ProfileView.profile:
      return MaterialPageRoute(
        builder: (context) => const ProfileView(),
      );
    case CallsView.calls:
      return MaterialPageRoute(
        builder: (context) => const ProfileView(),
      );
    case GroupsView.group:
      return MaterialPageRoute(
        builder: (context) =>  GroupsView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
