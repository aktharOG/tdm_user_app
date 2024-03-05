import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/view/model/home_model.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';
import 'package:tdm_user_app/view/screens/matches/match_details_screen.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class MoreMatchesScreen extends StatelessWidget {
  const MoreMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
            tag: "title",
            child: HeadingText(
              text: "Matches",
              fontSize: 20,
            )),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          homePro.onFetchHomeData();
        },
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: homePro.homeModel!.match.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
                        final model = homePro.homeModel!.match[index];
        
            return InkWell(
              onTap: () {
                push(
                    context,
                    MatchDetailsScreen(
                      index: index,
                      model: homePro.homeModel!.match[index],
                    ));
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
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(text: model.matchName?? "1 v 1 TDM Room Match"),
                            HeadingText(text: model.matchId?? "#akthar-user"),
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
      ),
    );
  }
}
