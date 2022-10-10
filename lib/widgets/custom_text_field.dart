import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final String hintText;
  final Color? hintColor;
  final double? hintSize;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? innerPadding;
  final int? lines;
  final Icon? iconRight;
  final Icon? iconLeft;
  final Icon? iconOutside;
  final bool? haveLabel;
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
    this.height,
    this.width,
    this.haveLabel = false,
    this.innerPadding,
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
    return Container(
      // color: white,
      height: height,
      width: width,
      alignment: Alignment.center,
      child: Container(
        color: black,
        child: TextField(
          maxLines: lines ?? 1,
          controller: inputController,
          style: const TextStyle(color: white),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.all(innerPadding ?? Dimentsions().sixteen),
              helperStyle: const TextStyle(color: white),
              // errorText: 'fad',
              prefixIcon: iconLeft,
              suffixIcon: iconRight,
              icon: iconOutside,
              labelStyle: TextStyle(color: textFldHintTextColor),
              enabledBorder: enabledTextField,
              focusedBorder: focusedTextField,
              border: enabledTextField,
              hintText: haveLabel == false ? hintText : null,
              labelText: haveLabel == true ? hintText : null,
              hintStyle: TextStyle(color: textFldHintTextColor)),
        ),
      ),
    );
  }
}
