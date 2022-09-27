import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protectanimal/screens/profile_screen/widgets/tab1.dart';
import 'package:protectanimal/screens/profile_screen/widgets/tab2.dart';
import 'package:protectanimal/screens/profile_screen/widgets/tab3.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';
import 'package:protectanimal/widgets/custom_avatar.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  List<String> list = ['edit profile', 'logout'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              centerTitle: false,
              backgroundColor: black,
              elevation: 0,
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.chevron_left, color: white)),
              title: const CustomText(
                text: 'Profile',
                size: textMediumSmallSize,
                w: FontWeight.w500,
              ),
              actions: [
                PopupMenuButton(
                    position: PopupMenuPosition.under,
                    padding: const EdgeInsets.all(0.0),
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                color: Colors.blue,
                                child: CustomText(text: list[0]),
                              )),
                          PopupMenuItem(
                              padding: const EdgeInsets.all(0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(loginRoute);
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: Colors.indigo,
                                  child: CustomText(text: list[1]),
                                ),
                              ))
                        ])
              ],
            ),
          ],
          body: Container(
            padding: const EdgeInsets.all(smallPadding),
            child: Column(children: [
              Row(
                children: [
                  const CustomAvatar(width: 70, height: 70),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText(
                          text: 'Esther Howard',
                        ),
                        CustomText(
                          text: 'Esther Howard',
                          isMedium: true,
                        ),
                        CustomText(
                          text: 'Esther Howard',
                          isSmall: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: bigPadding),
                  Divider(color: dividerColor, thickness: 1),
                  const SizedBox(height: bigPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          CustomText(
                            text: '239',
                            size: textMediumMediumSize,
                          ),
                          CustomText(
                            text: 'Posts',
                            isMedium: true,
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          CustomText(
                            text: '239',
                            size: textMediumMediumSize,
                          ),
                          CustomText(
                            text: 'Posts',
                            isMedium: true,
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          CustomText(
                            text: '239',
                            size: textMediumMediumSize,
                          ),
                          CustomText(
                            text: 'Posts',
                            isMedium: true,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: bigPadding),
                  Divider(color: dividerColor, thickness: 1),
                  const SizedBox(height: bigPadding),
                  CustomButton(
                      text: 'Edit Profile',
                      onTap: () {
                        Get.toNamed(updateProRoute);
                      }),
                  const SizedBox(height: smallPadding),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: TabBar(
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        unselectedLabelColor: textSmallColor,
                        indicatorColor: Colors.transparent,
                        labelColor: white,
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        tabs: const [
                          Tab(icon: Icon(Icons.sort)),
                          Tab(text: 'Stories'),
                          Tab(text: 'Photos'),
                        ]),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                    Tab1(),
                    Tab2(),
                    Tab3(),
                  ]))
            ]),
          ),
        ),
        backgroundColor: black,
      ),
    );
  }
}
