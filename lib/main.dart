import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/firebase_options.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/pref_services/pref_service.dart';
import 'package:tdm_user_app/view/provider/auth_provider.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';
import 'package:tdm_user_app/view/provider/match_provider.dart';
import 'package:tdm_user_app/view/provider/profile_provider.dart';
import 'package:tdm_user_app/view/screens/auth/login_screen.dart';
import 'package:tdm_user_app/view/screens/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesService().setPreferences();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => MatchProvider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
            navigatorKey: navigatorKey,
            theme:
                ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
            home: const SplashScreen()),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
