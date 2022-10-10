import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:protectanimal/screens/add_post_screen/add_post_screen.dart';
import 'package:protectanimal/screens/animal_info_screen/animal_info_screen.dart';
import 'package:protectanimal/screens/main_first/main_urnaa.dart';
import 'package:protectanimal/screens/login_screen/login_screen.dart';
import 'package:protectanimal/screens/main_screen/main_screen.dart';
import 'package:protectanimal/screens/profile_screen/profile_screen.dart';
import 'package:protectanimal/screens/register_screen/register_screen.dart';
import 'package:protectanimal/screens/splash_screen/splash_screen.dart';
import 'package:protectanimal/screens/update_profile_screen/update_profile_screen.dart';
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
        homeRoute: (context) => const HomeScreen(),
        loginRoute: (context) => LoginScreen(),
        splashRoute: (context) => const SplashScreen(),
        registerRoute: (context) => RegisterScreen(),
        profileRoute: (context) => ProfileScreen(),
        updateProRoute: (context) => UpdateProfileScreen(),
        mainRoute: (context) => const MainScreen(),
        animalInfoRoute: (context) => const AnimalInfoScreen(),
        addPostRoute: (context) => AddPostScreen(),
      },
    );
  }
}
