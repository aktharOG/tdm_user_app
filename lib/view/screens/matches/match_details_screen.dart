import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class MatchDetailsScreen extends StatefulWidget {
  final int index;
  const MatchDetailsScreen({super.key, required this.index});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xff323232),
      appBar: AppBar(
        title: const HeadingText(
          text: "Match Details",
          fontSize: 20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Container(
                width: 200.w,
                decoration: BoxDecoration(
                    color: const Color(0xffF2AC57),
                    borderRadius: BorderRadius.circular(50)),
                padding: const EdgeInsets.all(15),
                child: const Center(
                  child: HeadingText(
                    text: "12:34:56",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: const Color(0xffF2AC57),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingText(
                      text: "Match ID : #34343-32424-343-",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const HeadingText(
                      text: "Type    : 1 vs 1",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const HeadingText(
                      text: "Time   : 4:00  |   Start : 4:15",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Hero(
                      tag: widget.index,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    profileIMG,
                                    height: 120.h,
                                    width: 120.w,
                                  ),
                                ),
                                const HeadingText(text: "Player name")
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const HeadingText(
                              text: "VS",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    profileIMG,
                                    height: 120.h,
                                    width: 120.w,
                                  ),
                                ),
                                const HeadingText(text: "Player name")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 200.w,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(
                              text: "Room Name",
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            HeadingText(
                              text: "Password",
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: HeadingText(
                      maxLines: 10,
                      textAlign: TextAlign.left,
                      text:
                          "Room name and password will be available here before 15 minutes of match time",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.grey,
                              blurRadius: 10)
                        ]),
                    child: const HeadingText(
                      text: "NOTE",
                      color: Color(0xffFF7171),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            if (homePro.isJoined)
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      label: "Cancel",
                      backgroundColor: const Color(0xffFF7171),
                      onPressed: () {
                        homePro.onCancel();
                      },
                    )),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                        child: CustomButton(
                      label: "Chat",
                      backgroundColor: const Color(0xffF2AC57),
                      onPressed: () => Navigator.pop(context),
                    ))
                  ],
                ),
              )
            else
              CustomButton(
                width: 100,
                label: "Join",
                backgroundColor: const Color(0xff14A38B),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ShowDailogConfirmJoin(),
                  );
                },
              ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ShowDailogConfirmJoin extends StatelessWidget {
  const ShowDailogConfirmJoin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProvider>(context);
    return AlertDialog(
      backgroundColor: const Color(0xff27365C),
      content: SizedBox(
        height: 180.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: HeadingText(
                text: "Confirm Join ?",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const HeadingText(
              text: "Fee : 30₹",
              fontSize: 25,
            ),
            const HeadingText(
              text: "Winner : 50₹",
              fontSize: 25,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  label: "Cancel",
                  backgroundColor: const Color(0xffFF7171),
                  onPressed: () => Navigator.pop(context),
                )),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: CustomButton(
                  label: "Join",
                  backgroundColor: const Color(0xff14A38B),
                  onPressed: () {
                    homePro.onJoined().then((value) => Navigator.pop(context));
                  },
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
