import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protectanimal/utils/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/reindeer.svg',
                color: red,
              ),
              const Text(
                "Protect animal",
                style: TextStyle(
                    color: red, fontWeight: FontWeight.bold, fontSize: 19),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(color: grey, spreadRadius: 1),
                  ],
                  color: black,
                ),
                child: const Icon(
                  Icons.search,
                  color: grey,
                  size: 25,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
