import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RedirectToLogin() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      // Get.toNamed(loginRoute);
      Get.toNamed(homeRoute);
    });
  }

  @override
  void initState() {
    RedirectToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: red,
        child: Stack(
          children: [
            Center(child: SvgPicture.asset('assets/svgs/reindeer.svg')),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svgs/reindeerback.svg',
                width: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
