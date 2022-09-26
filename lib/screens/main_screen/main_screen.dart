import 'package:flutter/material.dart';
import 'package:protectanimal/screens/add_post_screen/add_post_screen.dart';
import 'package:protectanimal/screens/home_screen/home_screen.dart';
import 'package:protectanimal/screens/library_screen/library_screen.dart';
import 'package:protectanimal/screens/map_screen/map_screen.dart';
import 'package:protectanimal/screens/profile_screen/profile_screen.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_Inkwell.dart';

final List<Icon> bottomIcons = [
  const Icon(
    Icons.home_sharp,
    color: grey,
    size: 30,
  ),
  const Icon(
    Icons.map,
    color: grey,
    size: 30,
  ),
  const Icon(
    Icons.abc,
    color: grey,
  ),
  const Icon(
    Icons.sticky_note_2,
    color: grey,
    size: 30,
  ),
  const Icon(
    Icons.person,
    color: grey,
    size: 30,
  ),
];

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _bottomPadding = 0.0;

  final PageController _pageController = PageController();
  @override
  void initState() {
    print(_bottomPadding);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          MapScreen(),
          AddPostScreen(),
          LibraryScreen(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: white,
        elevation: 0,
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: darkBlue,
        onPressed: () {},
        child: const Icon(Icons.add_box_outlined, color: grey, size: 30),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
          color: darkBlue,
          shape: CircularNotchedRectangle(),
          // shape: const AutomaticNotchedShape(
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       top: Radius.circular(15),
          //     ),
          //   ),
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //   ),
          // ),
          notchMargin: 10,
          child: _customNavigationBar()),
    );
  }

  Widget _customNavigationBar() {
    return Container(
      width: double.infinity,
      // height: 50 + _bottomPadding,
      // padding: EdgeInsets.only(bottom: _bottomPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomIcons.asMap().entries.map((entry) {
          int idx = entry.key;
          Icon val = entry.value;

          return CustomNavigationItem(
            index: idx,
            icon: val,
            onClickListener: (selectedIndex) async {
              _pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              _pageController.jumpToPage(selectedIndex);
            },
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationItem extends StatelessWidget {
  final int? index;
  final Icon icon;
  final Function(int)? onClickListener;

  const CustomNavigationItem({
    Key? key,
    this.index,
    required this.icon,
    this.onClickListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index == 2 ? Colors.transparent : darkBlue,
      child: Container(
        // color: white,
        // margin: index == 1 ? const EdgeInsets.only(right: 70) : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // index == 2
            //     ? Container(
            //         width: 70,
            //       )
            //     : Container(),
            CustomInkWell(
              onTap: () {
                if (onClickListener != null) onClickListener!(index ?? 0);
              },
              child: IconButton(onPressed: () {}, icon: icon),
            ),
          ],
        ),
      ),
    );
  }
}
