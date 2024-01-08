import 'package:flutter/material.dart';
import 'package:tdm_user_app/view/screens/home/tabs/home_tab.dart';
import 'package:tdm_user_app/view/screens/home/tabs/profile_tab.dart';
import 'package:tdm_user_app/view/screens/home/tabs/wallet_tab.dart';

class HomeProvider extends ChangeNotifier{

     List<Widget> tabs = const[
      HomeTab(),
      WalletTab(),
      ProfileTab()
     ];

     int currentTab = 0;



     onChangeTab(value){
      currentTab = value;
      notifyListeners();
     }
}