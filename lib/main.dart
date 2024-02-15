import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/firebase_options.dart';
import 'package:tdm_user_app/view/provider/auth_provider.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';
import 'package:tdm_user_app/view/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
            theme:
                ThemeData(fontFamily: "Poppins", brightness: Brightness.dark),
            home: LoginScreen()),
      ),
    );
  }
}
