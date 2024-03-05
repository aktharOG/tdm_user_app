
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/view/provider/home_provider.dart';

class BannerView extends StatelessWidget {
  const BannerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homePro = context.watch<HomeProvider>();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
         // carouselController: homePro.carouselController,
          options: CarouselOptions(
            viewportFraction: 1,
            height: 200.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              homePro.onChangeBanner(index);
            },
          ),
          items: List.generate(5,
            (i) {
            // var slider = homePro.bannerList[i.key];
            return Builder(
              builder: (BuildContext context) {
                return CachedNetworkImage(
                  imageUrl: "${Apis.mediaUrl}/1708716650364.png",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey,
                  ),
                );
              },
            );
          },
          
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Center(
            child: DotsIndicator(
              dotsCount:
                  5,
              position: homePro.homeBannerIndex,
              decorator: const DotsDecorator(
                size: Size(7, 7),
                activeSize: Size(9, 9),
                color: Colors.grey, // Inactive color
                activeColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
