import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: homePro.tabs[homePro.currentTab],
      bottomNavigationBar: BottomNavigationBar
      (
      
         currentIndex: homePro.currentTab,
         onTap: homePro.onChangeTab,
         selectedItemColor: Colors.amber,
        //  showSelectedLabels: false,
        //  showUnselectedLabels: false,
        items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house,color: homePro.currentTab==0?Colors.amber:Colors.white,), label: "Home",),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.wallet,color: homePro.currentTab==1?Colors.amber:Colors.white,), label: "Wallet"),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.person,color: homePro.currentTab==2?Colors.amber:Colors.white,), label: "Profile")
      ]),
    );
  }
}
