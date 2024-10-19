import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/features/auth/presentation/view/login_view.dart';
import 'package:mini_chat_app_mentor_academy/features/splash/presentation/views/splash_view.dart';

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

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
