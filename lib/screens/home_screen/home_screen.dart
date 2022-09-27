import 'package:flutter/material.dart';
import 'package:protectanimal/screens/home_screen/components/home_header.dart';
import 'package:protectanimal/screens/profile_screen/widgets/tab1.dart';
import 'package:protectanimal/screens/profile_screen/widgets/tab2.dart';
import 'package:protectanimal/screens/profile_screen/widgets/tab3.dart';
import 'package:protectanimal/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          automaticallyImplyLeading: false,
          title: const HomeHeader(),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 380,
                  child: TabBar(
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      unselectedLabelColor: textSmallColor,
                      indicatorColor: Colors.transparent,
                      labelColor: white,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      tabs: const [
                        Tab(icon: Icon(Icons.sort)),
                        Tab(text: 'New update'),
                        Tab(text: 'Nearby'),
                        Tab(text: 'Following'),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
