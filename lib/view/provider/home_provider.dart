import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/services/dio_services/dio_service.dart';
import 'package:tdm_user_app/view/model/home_model.dart';
import 'package:tdm_user_app/view/screens/home/tabs/home_tab.dart';
import 'package:tdm_user_app/view/screens/home/tabs/profile_tab.dart';
import 'package:tdm_user_app/view/screens/home/tabs/wallet_tab.dart';

class HomeProvider extends ChangeNotifier {
  List<Widget> tabs = const [HomeTab(), WalletTab(), ProfileTab()];

  int currentTab = 0;

  HomeModel? homeModel;

  int homeBannerIndex = 0;

  onChangeBanner(value){
    homeBannerIndex = value;
    notifyListeners();
  }

  onChangeTab(value) {
    currentTab = value;
    notifyListeners();
  }

  bool isJoined = false;

  Future onJoined() async {
    isJoined = true;
    notifyListeners();
  }

  onCancel() {
    isJoined = false;
    notifyListeners();
  }

  onFetchHomeData() async {
    ResponseML? res =
        await ApiService.apiMethodSetup(method: apiMethod.get, url: Apis.home);

    if (res != null) {
      if (res.response != null) {
        print(res.response!.data);
        homeModel = homeModelFromJson(jsonEncode(res.response!.data));
      } else {
        showSnackBar(navigatorKey.currentContext!, "Something went wrong");
      }
    }
    notifyListeners();
  }
}
