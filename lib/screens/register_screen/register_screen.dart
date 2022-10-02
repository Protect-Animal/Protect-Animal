import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/services/auth_services.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  register() async {
    final response = await AuthServices().registerUser(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text);
    print(response);
    // if (response) {
    Get.toNamed(loginRoute);
    // } else {
    // print('error');
    // }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(bigPadding),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                  'assets/svgs/reindeer.svg',
                  color: red,
                )),
                // const CustomText(
                //   text: 'Hello',
                //   isLarge: true,
                // ),
                // const CustomText(
                //   text: 'Welcome to Reindeer',
                //   isLarge: true,
                // ),
                const SizedBox(height: 32),

                const CustomText(
                  text: 'Register',
                  size: textLargeSize,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  hintText: 'Username...',
                  inputController: usernameController,
                ),
                const SizedBox(height: bigPadding),
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

                CustomButton(text: 'Register', onTap: register),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(text: 'Already have an account? '),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(loginRoute);
                      },
                      child: const CustomText(text: 'Login'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
