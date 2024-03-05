// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/services/dio_services/dio_service.dart';
import 'package:tdm_user_app/services/pref_services/pref_service.dart';
import 'package:tdm_user_app/view/screens/home/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? "");

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  //! apis

  bool isLogin = false;
  onLogin() async {
    isLogin = true;
    notifyListeners();
    final data = {
      "username": usernameController.text,
      "password": passwordController.text
    };

    print("body : $data");
    ResponseML? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: "${Apis.baseUrl}${Apis.login}",
        data: data);

    if (res != null) {
      if (res.response != null) {
        print(res.response!.data);
        
        SharedPreferenceController().setInitialControllerValues(
            token: res.response!.data["accessToken"]);
              ApiService.dioInitializerAndSetter(token: res.response!.data["accessToken"]);
        pushAndRemoveUntil(navigatorKey.currentContext!, const HomeScreen());
        showSnackBar(navigatorKey.currentContext!, "Login Success");
      } else if (res.failed != null) {
        print(res.failed!.message);
        showSnackBar(navigatorKey.currentContext!, res.failed?.message??'');
      }else{
        print(res.failed);
      }
    }
        isLogin = false;
    notifyListeners();
  }
}
