import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_in_view.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/sign_up_view.dart';
import 'package:mini_chat_app_mentor_academy/features/chats/presentation/views/chat_view.dart';
import 'package:mini_chat_app_mentor_academy/features/home/presentation/view/home_view.dart';
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
        builder: (context) => const SigInView(),
      );
    case SigUpView.signUp:
      return MaterialPageRoute(
        builder: (context) => const SigUpView(),
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

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
