import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';
import 'package:protectanimal/utils/sp_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  RedirectToLogin() async {
    token = await SpManager().getAccessToken();
    if (token == '') {
      Get.toNamed(loginRoute);
    } else {
      Get.toNamed(mainRoute);
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      RedirectToLogin();
    });
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
