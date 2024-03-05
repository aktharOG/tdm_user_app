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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: authPro.formKey,
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
                    CustomTextfield(
                      controller: authPro.usernameController,
                      hint: "Username",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextfield(
                      controller: authPro.passwordController,
                      hint: "Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    //
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        isLoading: authPro.isLogin,
                        label: "Login",
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          if (authPro.formKey.currentState!.validate()) {
                            authPro.onLogin();
                          }
                          //   push(context, const HomeScreen());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            authPro.signInWithGoogle();
                          },
                          child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 35,
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                size: 50,
                              )),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        const HeadingText(
                          text: "OR",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        const CircleAvatar(
                            radius: 35,
                            child: FaIcon(FontAwesomeIcons.facebook, size: 50)),
                      ],
                    ),
                  ],
                ),
              ),
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
  final String? Function(String?)? validator;
  final bool isLoading;
  final Color? bgColor;
  const CustomTextfield(
      {super.key,
      required this.hint,
      this.controller,
      this.validator,
      this.isLoading = false,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: bgColor ?? Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  )),
              TextFormField(
                controller: controller,
                validator: validator,
                //   onSaved: (val) => _username = val,
                obscureText: false,
                keyboardType: TextInputType.name,
                //  controller: _controllerUsername,
                autocorrect: false,

                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.transparent)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


        // Container(
        //   height: 50,
        //   margin: EdgeInsets.symmetric(horizontal: 20.w),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: TextFormField(
        //     validator: validator,
        //     decoration: InputDecoration(
        //         fillColor: Colors.white,
        //         focusColor: Colors.white,
        //         hoverColor: Colors.white,
        //         iconColor: Colors.white,
        //         hintText: hint,
        //         hintStyle: const TextStyle(color: Colors.grey),
        //         enabledBorder: const OutlineInputBorder(),
        //         focusedBorder: OutlineInputBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //             borderSide: BorderSide(color: Colors.blue)),
        //         contentPadding:
        //             EdgeInsets.only(bottom: 50,top: 10),
        //         disabledBorder: const OutlineInputBorder(),
        //         border: InputBorder.none),
        //     autocorrect: false,
        //     controller: controller,
        //   ),
        // ),
