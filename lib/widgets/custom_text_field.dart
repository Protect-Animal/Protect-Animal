import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final Color? hintColor;
  final double? hintSize;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  const CustomTextField({
    Key? key,
    this.hintColor,
    this.hintSize,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabledTextField = OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: borderColor ?? White, width: 1));
    final focusedTextField = OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide:
            BorderSide(color: borderColor ?? White, width: borderWidth ?? 1));
    return TextField(
      style: const TextStyle(color: White),
      decoration: InputDecoration(
          enabledBorder: enabledTextField,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: Colors.white, width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: Colors.white, width: 1)),
          hintText: 'Email address',
          hintStyle: TextStyle(color: TextFldHintTextColor)),
    );
  }
}
