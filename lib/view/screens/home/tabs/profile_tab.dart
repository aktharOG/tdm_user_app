import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdm_user_app/constants/app_images.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
