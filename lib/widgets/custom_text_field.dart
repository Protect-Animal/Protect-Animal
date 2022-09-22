import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color? hintColor;
  final double? hintSize;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final TextEditingController? inputController;
  const CustomTextField({
    Key? key,
    this.hintColor,
    this.hintSize,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.inputController,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabledTextField = OutlineInputBorder(
        borderRadius: BorderRadius.circular(bigPadding),
        borderSide: BorderSide(color: borderColor ?? white, width: 1));
    final focusedTextField = OutlineInputBorder(
        borderRadius: BorderRadius.circular(bigPadding),
        borderSide:
            BorderSide(color: borderColor ?? white, width: borderWidth ?? 1));
    return TextField(
      controller: inputController,
      style: const TextStyle(color: white),
      decoration: InputDecoration(
          enabledBorder: enabledTextField,
          focusedBorder: focusedTextField,
          border: enabledTextField,
          hintText: hintText,
          hintStyle: TextStyle(color: textFldHintTextColor)),
    );
  }
}
