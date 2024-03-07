import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/constants/app_theme.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/view/model/home_model.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';
import 'package:tdm_user_app/view/provider/match_provider.dart';
import 'package:tdm_user_app/view/provider/profile_provider.dart';
import 'package:tdm_user_app/view/screens/home/widgets/banner_view.dart';
import 'package:tdm_user_app/view/screens/matches/create_match_screen.dart';
import 'package:tdm_user_app/view/screens/matches/match_details_screen.dart';
import 'package:tdm_user_app/view/screens/matches/more_matches_screen.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final homePro = context.watch<HomeProvider>();
    final profilePro = context.watch<ProfileProvider>();
    final matchPro = context.watch<MatchProvider>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff48245D),
              Color.fromARGB(188, 49, 15, 185),
              Color(0xff540062)
            ])),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomMaterialIndicator(
            onRefresh: () async {
              homePro.onFetchHomeData();
              matchPro.onFetchYourMatches();
            }, // Your refresh logic
            indicatorBuilder: (context, controller) {
              return const Icon(
                Icons.gamepad,
                color: Colors.blue,
                size: 30,
              );
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText(
                      textAlign: TextAlign.start,
                      text:
                          "Welcome, ${profilePro.profileModel?.data?.username}",
                      fontSize: 18.sp,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: CachedNetworkImageProvider(
                          "${Apis.mediaUrl}/${profilePro.profileModel?.data?.img}"),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const BannerView(),
                SizedBox(
                  height: 20.h,
                ),
                TopPlayersView(profilePro: profilePro),
                const Row(
                  children: [
                    HeadingText(text: "Booked Matches"),
                  ],
                ),
                SizedBox(
                  height: 180,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.3 / 2, crossAxisCount: 1),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    color: Colors.red,
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    color: Colors.red,
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const CustomButton(label: "View")
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // const HeadingText(
                            //   text: "Entry : 100\$",
                            //   fontSize: 12,
                            // ),
                            // const HeadingText(
                            //   text: "Prize : 180\$",
                            //   fontSize: 12,
                            // ),
                            // const HeadingText(
                            //   text: "Type : 1 Vs 1",
                            //   fontSize: 15,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (matchPro.yourMatchesList.isNotEmpty)
                  const YourMatchesView(),
                const MatchView(),
                const Row(
                  children: [
                    HeadingText(text: "For You"),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 600,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 3.5, crossAxisCount: 2),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    color: Colors.red,
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    color: Colors.red,
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const HeadingText(
                              text: "Entry : 100\$",
                              fontSize: 12,
                            ),
                            const HeadingText(
                              text: "Prize : 180\$",
                              fontSize: 12,
                            ),
                            const HeadingText(
                              text: "Type : 1 Vs 1",
                              fontSize: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     HeadingText(
                //       text: "Live",
                //       fontSize: 15.sp,
                //       fontWeight: FontWeight.bold,
                //       color: const Color(0xffFF7171),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 15.h,
                // ),
                // ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Image.asset(
                //       livePoster,
                //       height: 200,
                //       width: MediaQuery.of(context).size.width,
                //       fit: BoxFit.cover,
                //     ))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          push(context, const CreateMatchScreen());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class YourMatchesView extends StatelessWidget {
  const YourMatchesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final matchPro = context.watch<MatchProvider>();
    return Column(
      children: [
        const Row(
          children: [
            HeadingText(text: "Your Matches"),
          ],
        ),
        SizedBox(
          height:matchPro.yourMatchesList.length>2?400: 200,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: matchPro.yourMatchesList.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.8 / 3, crossAxisCount: matchPro.yourMatchesList.length>2? 2:1),
            itemBuilder: (context, index) => YourMatchItem(
              matchML: matchPro.yourMatchesList[index],
            ),
          ),
        ),
      ],
    );
  }
}

class YourMatchItem extends StatelessWidget {
  final MatchML matchML;
  const YourMatchItem({super.key, required this.matchML});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                HeadingText(text: matchML.matchName ?? ''),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.red,
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.red,
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    )
                  ],
                ),
                const CustomButton(label: "View")
                // const SizedBox(
                //   height: 10,
                // ),
                // const HeadingText(
                //   text: "Entry : 100\$",
                //   fontSize: 12,
                // ),
                // const HeadingText(
                //   text: "Prize : 180\$",
                //   fontSize: 12,
                // ),
                // const HeadingText(
                //   text: "Type : 1 Vs 1",
                //   fontSize: 15,
                // )
              ],
            ),
            Align(
                alignment: Alignment.topRight,
                child: Consumer<MatchProvider>(builder: (context, matchPro, i) {
                  return InkWell(
                    onTap: () {
                      matchPro.onDeleteMatches(matchML.id);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.delete),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}

class MatchView extends StatelessWidget {
  const MatchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
                tag: "title",
                child: HeadingText(
                  text: "Matches",
                  fontSize: 15.sp,
                )),
            InkWell(
              onTap: () {
                push(context, const MoreMatchesScreen());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeadingText(
                    text: "See all",
                    color: Color(0xffFF7171),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(
                    Icons.arrow_right_rounded,
                    size: 40,
                    color: Color(0xffFF7171),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 130.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => SizedBox(
              width: 10.w,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: homePro.homeModel?.match.length ?? 0,
            itemBuilder: (context, index) => MatchItem(
              index: index,
              model: homePro.homeModel!.match[index],
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

class MatchItem extends StatelessWidget {
  final int index;
  final MatchML model;
  const MatchItem({super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        push(
            context,
            MatchDetailsScreen(
              index: index,
              model: model,
            ));
      },
      child: Hero(
        tag: index,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                bgmiIMG,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            //     CachedNetworkImage(
            //       height: 80,

            //   imageUrl: "${Apis.mediaUrl}/${model.matchType}",
            //   fit: BoxFit.cover,
            //   width: 100,
            //   errorWidget: (context, url, error) => const Icon(
            //     Icons.image,
            //     size: 100,
            //     color: Colors.grey,
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(
                    text: "player",
                    fontSize: 12,
                  ),
                  HeadingText(
                    text: "11k points",
                    fontSize: 8,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopPlayersView extends StatelessWidget {
  const TopPlayersView({
    super.key,
    required this.profilePro,
  });

  final ProfileProvider profilePro;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(
                  "${Apis.mediaUrl}/${profilePro.profileModel?.data?.img}"),
            ),
            const SizedBox(
              height: 5,
            ),
            const HeadingText(
              text: "player",
              fontSize: 12,
            ),
            const HeadingText(
              text: "11k points",
              fontSize: 8,
            )
          ],
        ),
      ),
    );
  }
}
