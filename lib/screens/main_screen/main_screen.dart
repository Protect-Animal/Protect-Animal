import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protectanimal/screens/add_post_screen/add_post_screen.dart';
import 'package:protectanimal/screens/home_screen/home_screen.dart';
import 'package:protectanimal/screens/library_screen/library_screen.dart';
import 'package:protectanimal/screens/map_screen/map_screen.dart';
import 'package:protectanimal/screens/profile_screen/profile_screen.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_Inkwell.dart';

// final List<Icon> bottomIcons = [
//   const Icon(
//     Icons.home_sharp,
//     color: grey,
//     size: 30,
//   ),
//   const Icon(
//     Icons.map,
//     color: grey,
//     size: 30,
//   ),
//   const Icon(
//     Icons.abc,
//     color: grey,
//   ),
//   const Icon(
//     Icons.sticky_note_2,
//     color: grey,
//     size: 30,
//   ),
//   const Icon(
//     Icons.person,
//     color: grey,
//     size: 30,
//   ),
// ];
final List<SvgPicture> bottomSvgs = [
  SvgPicture.asset(
    'assets/svgs/bottomNav/home-1.svg',
  ),
  SvgPicture.asset(
    'assets/svgs/bottomNav/map-1.svg',
  ),
  SvgPicture.asset(
    'assets/svgs/bottomNav/add-square.svg',
    color: Colors.transparent,
  ),
  SvgPicture.asset('assets/svgs/bottomNav/archive.svg'),
  SvgPicture.asset('assets/svgs/bottomNav/calendar.svg'),
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
    print(_bottomPadding);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: BottomAppBar(
            color: darkBlue,
            // shape: CircularNotchedRectangle(),
            shape: const AutomaticNotchedShape(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
            ),
            notchMargin: 10,
            child: _customNavigationBar()),
      ),
    );
  }

  Widget _customNavigationBar() {
    return SizedBox(
      width: double.infinity,
      height: _bottomPadding + 10,
      // padding: EdgeInsets.only(bottom: _bottomPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomSvgs.asMap().entries.map((entry) {
          int idx = entry.key;
          SvgPicture val = entry.value;

          return CustomNavigationItem(
            index: idx,
            svg: val,
            onClickListener: (selectedIndex) async {
              _pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              // _pageController.jumpToPage(selectedIndex);
            },
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationItem extends StatefulWidget {
  final int? index;
  final SvgPicture svg;
  final Function(int)? onClickListener;

  const CustomNavigationItem({
    Key? key,
    this.index,
    this.onClickListener,
    required this.svg,
  }) : super(key: key);

  @override
  State<CustomNavigationItem> createState() => _CustomNavigationItemState();
}

class _CustomNavigationItemState extends State<CustomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    List<SvgPicture> bottomSvgs = [
      SvgPicture.asset(
        'assets/svgs/bottomNav/home-1.svg',
      ),
      SvgPicture.asset(
        'assets/svgs/bottomNav/map-1.svg',
      ),
      SvgPicture.asset(
        'assets/svgs/bottomNav/add-square.svg',
        color: Colors.transparent,
      ),
      SvgPicture.asset('assets/svgs/bottomNav/archive.svg'),
      SvgPicture.asset('assets/svgs/bottomNav/calendar.svg'),
    ];
    return Container(
      color: widget.index == 2 ? Colors.transparent : darkBlue,
      child: Container(
        height: double.infinity,
        width: 50,
        // padding: EdgeInsets.all(textSmallSize),
        // color: white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // index == 2
            //     ? Container(
            //         width: 70,
            //       )
            //     : Container(),
            widget.index == 2
                ? Container(
                    // color: Colors.transparent,
                    )
                : CustomInkWell(
                    onTap: () {
                      if (widget.onClickListener != null)
                        widget.onClickListener!(widget.index ?? 0);
                    },
                    child: Container(
                      child: widget.svg,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
