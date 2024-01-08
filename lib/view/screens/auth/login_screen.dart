import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/constants/app_icons.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/view/provider/auth_provider.dart';
import 'package:tdm_user_app/view/screens/home/home_screen.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';
import 'package:tdm_user_app/view/widgets/svg_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authPro = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                const HeadingText(
                  text: "Login",
                  fontSize: 80,
                  fontFamily: "Asus Rog",
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15.h,
                ),
                const CustomTextfield(
                  hint: "Username",
                ),
                SizedBox(
                  height: 15.h,
                ),
                const CustomTextfield(
                  hint: "Password",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    label: "Login",
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    onPressed: (){
                      push(context, HomeScreen());
                    },
                  ),
                ),
                SizedBox(height: 25.h,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 35,
                    child: FaIcon(FontAwesomeIcons.google,size: 50,)),
                  SizedBox(width: 15.w,),
                  HeadingText(text: "OR",fontSize: 30,color: Colors.white,),
                                  SizedBox(width: 15.w,),
        
                                  CircleAvatar(
                                                      radius: 35,
        
                                    child: FaIcon(FontAwesomeIcons.facebook,size: 50)),
        
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  const CustomTextfield({super.key, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            iconColor: Colors.white,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            disabledBorder: const OutlineInputBorder(),
            border: InputBorder.none),
        controller: controller,
      ),
    );
  }
}
