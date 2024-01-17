import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/view/screens/matches/match_details_screen.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class MoreMatchesScreen extends StatelessWidget {
  const MoreMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
            tag: "title",
            child: HeadingText(
              text: "Matches",
              fontSize: 20,
            )),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
                push(context,  MatchDetailsScreen(index: index,));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(profileIMG),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingText(text: "1 v 1 TDM Room Match"),
                          HeadingText(text: "#akthar-user"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Hero(
                    tag: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        homeSlider,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
