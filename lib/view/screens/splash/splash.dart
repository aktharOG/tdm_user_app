// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/dio_service.dart';
import 'package:tdm_user_app/services/pref_services/pref_service.dart';
import 'package:tdm_user_app/view/screens/auth/login_screen.dart';
import 'package:tdm_user_app/view/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
      
      checkUserStatus(){
         Timer(const Duration(seconds: 2), () async {
      String? token = await SharedPreferenceController().getToken();
      print("token : $token");
      if (token != null) {
        ApiService.dioInitializerAndSetter(token: token);
        pushAndRemoveUntil(context, const HomeScreen());
      } else {
        pushAndRemoveUntil(context, const LoginScreen());
      }
    });
      }

  @override
  void initState() {
    super.initState();
   checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          livePoster,
          height: 200,
        ),
      ),
    );
  }
}
