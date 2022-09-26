import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color? hintColor;
  final double? hintSize;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final int? lines;
  final Icon? iconRight;
  final Icon? iconLeft;
  final Icon? iconOutside;
  final TextEditingController inputController;
  const CustomTextField({
    Key? key,
    this.hintColor,
    this.hintSize,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    required this.inputController,
    required this.hintText,
    this.lines,
    this.iconRight,
    this.iconLeft,
    this.iconOutside,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabledTextField = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? bigPadding),
        borderSide: BorderSide(color: borderColor ?? white, width: 1));
    final focusedTextField = OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? bigPadding),
        borderSide:
            BorderSide(color: borderColor ?? white, width: borderWidth ?? 1));
    return TextField(
      maxLines: lines ?? 1,
      controller: inputController,
      style: const TextStyle(color: white),
      decoration: InputDecoration(
          helperStyle: const TextStyle(color: white),
          // errorText: 'fad',
          prefixIcon: iconLeft,
          suffixIcon: iconRight,
          icon: iconOutside,
          labelText: hintText,
          labelStyle: TextStyle(color: textFldHintTextColor),
          enabledBorder: enabledTextField,
          focusedBorder: focusedTextField,
          border: enabledTextField,
          // hintText: hintText,
          hintStyle: TextStyle(color: textFldHintTextColor)),
    );
  }
}
