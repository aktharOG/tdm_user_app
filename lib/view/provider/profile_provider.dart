// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/services/dio_services/dio_service.dart';
import 'package:tdm_user_app/services/pref_services/pref_service.dart';
import 'package:tdm_user_app/view/model/profile_model.dart';
import 'package:tdm_user_app/view/screens/auth/login_screen.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModel? profileModel;

  onFetchProfile() async {
    ResponseML? res = await ApiService.apiMethodSetup(
        method: apiMethod.get, url: Apis.profile);
    if (res != null) {
      if (res.response != null) {
        print("res : ${res.response?.data}");
        if (res.response?.data["status"]) {
          profileModel = profileModelFromJson(jsonEncode(res.response?.data));
        } else {
          onLogout();
          showSnackBar(
              navigatorKey.currentContext!, "Token Expired Login Again !!");
            
        }
      } else {
        showSnackBar(navigatorKey.currentContext!, res.failed?.message ?? '');
      }
    }
    notifyListeners();
  }

  onLogout() {
    SharedPreferencesService.prefs.clear();
    ApiService.tokenRemover();
    pushAndRemoveUntil(navigatorKey.currentContext!, const LoginScreen());
  }
}
