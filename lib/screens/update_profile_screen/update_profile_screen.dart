import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:protectanimal/screens/login_screen/login_screen.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.chevron_left,
            color: white,
            size: textLargeSize,
          ),
        ),
        title: const CustomText(
          text: 'Edit profile',
          size: textMediumMediumSize,
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(textBigSize),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                  ),
                ),
                const Center(
                    child: Icon(
                  Icons.photo_camera_outlined,
                  color: white,
                )),
              ],
            ),
            const SizedBox(height: textLargeSize),
            CustomTextField(
                borderRadius: extrasmallPadding,
                borderColor: textSmallColor,
                inputController: nameController,
                hintText: 'Your name'),
            const SizedBox(height: textBigSize),
            CustomTextField(
                borderRadius: extrasmallPadding,
                borderColor: textSmallColor,
                iconRight: Icon(
                  Icons.map,
                  color: textMediumColor,
                ),
                inputController: locationController,
                hintText: 'Location'),
            const SizedBox(height: textBigSize),
            CustomTextField(
                borderRadius: extrasmallPadding,
                borderColor: textSmallColor,
                iconRight: Icon(
                  Icons.calendar_month,
                  color: textMediumColor,
                ),
                inputController: birthdayController,
                hintText: 'Birthday'),
            const SizedBox(height: textBigSize),
            CustomTextField(
                borderRadius: extrasmallPadding,
                borderColor: textSmallColor,
                inputController: genderController,
                hintText: 'Sex'),
            const SizedBox(height: textBigSize),
            CustomTextField(
                borderRadius: extrasmallPadding,
                borderColor: textSmallColor,
                lines: 3,
                inputController: bioController,
                hintText: 'Say something about you'),
            const SizedBox(height: textBigSize),
            Flexible(flex: 1, child: Container()),
            const CustomButton(text: 'Update'),
            const SizedBox(height: textSmallSize),
            const CustomButton(text: 'Cancel', color: black)
          ],
        ),
      ),
    );
  }
}
