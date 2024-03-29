import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdm_user_app/constants/app_icons.dart';
import 'package:tdm_user_app/constants/app_theme.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';
import 'package:tdm_user_app/view/widgets/svg_icon.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  HeadingText(
            text: "Wallet",
            fontSize: 18.sp,
          ),
        //  actions: const [SvgIcon(path: coinIC)],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff48245D),
                        Color.fromARGB(255, 0, 0, 0)
                      ])),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingText(
                            text: "Balance",
                            fontSize: 15.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: HeadingText(
                              text: "230",
                              fontSize: 25.sp,
                            ),
                          )
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingText(text: "Winnings "),
                          HeadingText(
                            text: "230",
                            fontSize: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        HeadingText(text: "1 Coin = ₹1"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ HeadingText(text: "History",fontSize: 18.sp,),
                
                  SizedBox(
              height: 20.h,
            ),
             ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              tileColor: const Color(0xffF2AC57),
              title:  HeadingText(text: "10 Coins Added To Wallet",fontSize: 15.sp,),
              subtitle: const HeadingText(text: "10/11/2023",fontSize: 12,textAlign: TextAlign.right,),
              
             )
                ],
              ),
            ),
            ],),

             Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      label: "TOP UP",
                      backgroundColor: const Color(0xff7C9CBF),
                      onPressed: () {
                      },
                    )),
                    SizedBox(
                      width: 15.w,
                    ),
                    const Expanded(
                        child: CustomButton(
                      label: "Withdraw",
                      backgroundColor: Color(0xffF2AC57),
                   //   onPressed: () => Navigator.pop(context),
                    ))
                  ],
                ),
              )
          ],

          
        ));
  }
}
