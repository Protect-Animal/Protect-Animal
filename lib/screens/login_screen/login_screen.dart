import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protectanimal/services/auth_services.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';
import 'package:protectanimal/utils/sp_manager.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    loginUser() async {
      SpManager sharedPreference = SpManager();
      final response = await AuthServices().loginUser(
          email: emailController.text, password: passwordController.text);
      print(response['token']);
      if (response['token'] != null) {
        await sharedPreference.saveAccessToken(response['token']);
        Get.toNamed(mainRoute);
      } else {
        print('username or password wrong');
      }
    }

    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(bigPadding),
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Center(
                  child: SvgPicture.asset(
                'assets/svgs/reindeer.svg',
                color: red,
              )),
              const CustomText(
                text: 'Hello',
                size: textLargeSize,
              ),
              const CustomText(
                text: 'Welcome to Reindeer',
                size: textLargeSize,
              ),
              const SizedBox(height: 32),
              const CustomText(
                text: 'Login',
                size: textLargeSize,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                haveLabel: true,
                hintText: 'Email address...',
                inputController: emailController,
              ),
              const SizedBox(height: bigPadding),
              CustomTextField(
                height: 50,
                haveLabel: true,
                hintText: 'Password...',
                inputController: passwordController,
              ),
              const SizedBox(height: bigPadding),
              CustomButton(text: 'Login', onTap: loginUser),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: 'New to Reindeer'),
                  const SizedBox(width: 12),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(registerRoute);
                      },
                      child: const CustomText(
                        text: 'Register',
                        isMedium: true,
                        textColor: white,
                      ))
                ],
              ),
              const SizedBox(height: bigPadding),
              Center(
                  child: GestureDetector(
                onTap: () {
                  Get.toNamed(profileRoute);
                },
                child: CustomText(
                  text: 'Im a ghost user',
                  textColor: textFldHintTextColor,
                  size: textMediumSize,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
