import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomText extends StatelessWidget {
  final FontWeight? w;
  final double? size;
  final Color? textColor;
  final bool? isTitle;
  final bool? isLarge;
  final bool? isMedium;
  final bool? isSmall;
  final String text;
  const CustomText({
    Key? key,
    this.w,
    this.size,
    this.textColor,
    this.isTitle = false,
    this.isLarge = false,
    this.isMedium = false,
    this.isSmall = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ??
            (isTitle != false
                ? white
                : isMedium != false
                    ? textMediumColor
                    : isSmall != false
                        ? textSmallColor
                        : white),
        fontWeight: isTitle != false ? FontWeight.w500 : w ?? FontWeight.bold,
        fontSize: size ??
            (isTitle != false
                ? textBigSize
                : isMedium != false
                    ? textMediumSize
                    : isSmall != false
                        ? textSmallSize
                        : textBigSize),
      ),
    );
  }
}
