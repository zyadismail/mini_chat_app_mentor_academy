import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_chat_app_mentor_academy/core/helper/on_generate_routes.dart';
import 'package:mini_chat_app_mentor_academy/core/services/service_locator.dart';
import 'package:mini_chat_app_mentor_academy/features/home/presentation/view/home_view.dart';
import 'package:mini_chat_app_mentor_academy/features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
          ),
          // textTheme: GoogleFonts.interTextTheme(),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: FirebaseAuth.instance.currentUser != null
            ? HomeView.home 
            : SplashView.splashView,
      ),
    );
  }
}
