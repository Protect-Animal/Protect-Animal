import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool? isTitle;
  final double? size;
  final Color? textColor;
  final FontWeight? w;
  const CustomText({
    Key? key,
    required this.text,
    this.isTitle = false,
    this.size,
    this.textColor,
    this.w,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? white,
          fontWeight: isTitle != false ? FontWeight.w500 : w ?? FontWeight.bold,
          fontSize: size ?? textBigSize),
    );
  }
}
