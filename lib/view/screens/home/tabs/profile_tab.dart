import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/constants/app_images.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/view/provider/profile_provider.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final profilePro = Provider.of<ProfileProvider>(context, listen: false);
      profilePro.onFetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profilePro = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RefreshIndicator(
          onRefresh: () async {
            profilePro.onFetchProfile();
          },
          child: ListView(
            children: [
              HeadingText(
                text: "Account",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                children: [
                  if (profilePro.profileModel?.data?.img != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: CachedNetworkImageProvider(
                              "${Apis.mediaUrl}/${profilePro.profileModel?.data?.img}"),
                        ),
                      ),
                    )
                  else
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xff7C9CBF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 3)),
                child: Column(
                  children: [
                    ProfileItem(
                      leading: "user",
                      trailing:
                          profilePro.profileModel?.data?.username ?? "Akthar",
                    ),
                    ProfileItem(
                      leading: "ID",
                      trailing: profilePro.profileModel?.data?.igi.toString() ??
                          "454534343",
                    ),
                    ProfileItem(
                      leading: "IGN",
                      trailing:
                          profilePro.profileModel?.data?.ign ?? "AktcweDK",
                    ),
                    ProfileItem(
                      leading: "Name",
                      trailing:
                          profilePro.profileModel?.data?.name ?? "97463727289",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomButton(
                              label: "Cancel",
                              backgroundColor: Colors.red,
                              onPressed: () {
                                pop(navigatorKey.currentContext);
                              },
                            )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: CustomButton(
                              label: "Logout",
                              onPressed: () {
                                profilePro.onLogout();
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                label: "Logout",
                backgroundColor: const Color(0xffFF7171),
                foregroundColor: Colors.white,
              )
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
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          const HeadingText(text: ":"),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 2,
            child: HeadingText(
              textAlign: TextAlign.start,
              text: trailing,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
