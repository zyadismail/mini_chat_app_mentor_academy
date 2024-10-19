import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_chat_app_mentor_academy/core/helper/on_generate_routes.dart';
import 'package:mini_chat_app_mentor_academy/features/splash/presentation/views/splash_view.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green,),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
    onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.splashView,
    );
  }
}