import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // const focusedinputBorder = OutlineInputBorder(
    //     borderSide: BorderSide(color: HoodThemeColor, width: 1.0),
    //     borderRadius: BorderRadius.all(Radius.circular(bigPadding.0)));
    // final inputBorder = OutlineInputBorder(
    //     borderSide:
    //         BorderSide(color: borderColor ?? HoodTxtFldPlhColor, width: 1.0),
    //     borderRadius: BorderRadius.all(Radius.circular(bigPadding.0)));
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(bigPadding),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                hintText: 'Email address...',
                inputController: emailController,
              ),
              const SizedBox(height: bigPadding),
              CustomTextField(
                hintText: 'Password...',
                inputController: passwordController,
              ),
              const SizedBox(height: bigPadding),
              const CustomButton(text: 'Login'),
              Flexible(
                child: Container(),
                flex: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'New to Reindeer'),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(registerRoute);
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}

