import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // const focusedinputBorder = OutlineInputBorder(
    //     borderSide: BorderSide(color: HoodThemeColor, width: 1.0),
    //     borderRadius: BorderRadius.all(Radius.circular(16.0)));
    // final inputBorder = OutlineInputBorder(
    //     borderSide:
    //         BorderSide(color: borderColor ?? HoodTxtFldPlhColor, width: 1.0),
    //     borderRadius: BorderRadius.all(Radius.circular(16.0)));
    return Scaffold(
      backgroundColor: AppBlack,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppContainerPadding),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SvgPicture.asset(
                'assets/svgs/reindeer.svg',
                color: AppRedColor,
              )),
              Text(
                'Hello',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              Text(
                'Welcome to Reindeer',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              const SizedBox(height: 16),
              CustomTextField()
            ],
          ),
        ),
      ),
    );
  }
}
