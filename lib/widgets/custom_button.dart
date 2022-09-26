import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Function()? onTap;
  const CustomButton({
    Key? key,
    required this.text,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color ?? red,
            borderRadius: BorderRadius.circular(bigPadding)),
        height: 50,
        width: double.infinity,
        child: Center(
          child: CustomText(
            text: text,
            isTitle: true,
          ),
        ),
      ),
    );
  }
}
