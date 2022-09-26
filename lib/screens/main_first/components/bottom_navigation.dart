import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class BottomNavigation extends StatelessWidget {
  final int index;
  final Function setIndex;

  const BottomNavigation({super.key, required this.index, required this.setIndex,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.home_sharp,
              color: grey,
              size: 30,
            ),
            onPressed: () {
              setIndex(0);
            },
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.map,
            color: grey,
            size: 30,
          ),
          onPressed: () {
            setIndex(1);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.abc,
            color: grey,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.sticky_note_2,
            color: grey,
            size: 30,
          ),
          onPressed: () {
            setIndex(3);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            icon: const Icon(
              Icons.person,
              color: grey,
              size: 30,
            ),
            onPressed: () {
              setIndex(4);
            },
          ),
        ),
      ],
    );
  }
}
