import 'package:flutter/material.dart';
import 'package:protectanimal/screens/home_screen/components/bottom_navigation.dart';
import 'package:protectanimal/screens/home_screen/components/home_header.dart';
import 'package:protectanimal/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      appBar: AppBar(
        backgroundColor: black,
        automaticallyImplyLeading: false,
        title: const HomeHeader(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkBlue,
        onPressed: () {
          _onItemTapped(2);
        },
        child: const Icon(Icons.add_box_outlined, color: grey, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: darkBlue,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: BottomNavigation(index: _selectedIndex,  setIndex: _onItemTapped),
      ),
    );
  }
}
