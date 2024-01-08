import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(
                text: "Account",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(profileIMG),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100.w),
                    child: const Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.verified,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xff7C9CBF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white,width: 3)),
                child: Column(
                  children: [
                    ProfileItem(
                      leading: "Name",
                      trailing: "Akthar",
                    ),
                    ProfileItem(
                      leading: "ID",
                      trailing: "454534343",
                    ),
                    ProfileItem(
                      leading: "IGN",
                      trailing: "AktcweDK",
                    ),
                     ProfileItem(
                      leading: "Phone",
                      trailing: "97463727289",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
          
              CustomButton(label: "Logout",backgroundColor: Color(0xffFF7171),foregroundColor: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String leading, trailing;
  const ProfileItem({super.key, required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: HeadingText(
              textAlign: TextAlign.start,
              text: leading,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          HeadingText(text: ":"),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 2,
            child: HeadingText(
              textAlign: TextAlign.start,
              text: trailing,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
