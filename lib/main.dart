import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:protectanimal/screens/home_screen/home_screen.dart';
import 'package:protectanimal/screens/login_screen/login_screen.dart';
import 'package:protectanimal/screens/splash_screen/splash_screen.dart';
import 'package:protectanimal/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(fontFamily: 'Nunito'),
      initialRoute: splashRoute,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        homeRoute: (context) => HomeScreen(),
        loginRoute: (context) => LoginScreen(),
        splashRoute: (context) => SplashScreen()
      },
    );
  }
}
