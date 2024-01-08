import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
           Color(0xff48245D),
           Color.fromARGB(188, 49, 15, 185),
           Color(0xff540062) 
          ])
        ),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios)),
                const SizedBox(
                  height: 20,
                ),
                const HeadingText(
                  text: "Welcome, akthar.",
                  fontSize: 30,
                ),
                SizedBox(height: 20.h,),
                Image.asset(homeSlider,width: MediaQuery.of(context).size.width,),
                SizedBox(height: 20.h,),
              const  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  HeadingText(text: "Matches",fontSize: 25,fontWeight: FontWeight.bold,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    HeadingText(text: "See all",color: Color(0xffFF7171),fontSize: 18,fontWeight: FontWeight.bold,),
                    Icon(Icons.arrow_right_rounded,size: 40,color: Color(0xffFF7171),)
                  ],)
                ],),
                SizedBox(height: 15.h,),
            
                SizedBox(height: 100.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) =>Image.asset(homeSlider,width:180,height: 100,) ,),),
            
                  SizedBox(height: 20.h,),
                   const  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  HeadingText(text: "Live",fontSize: 25,fontWeight: FontWeight.bold,color:Color(0xffFF7171) ,),
                  
                ],),
                SizedBox(height: 15.h,),
            
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(livePoster,height: 200,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,))
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}