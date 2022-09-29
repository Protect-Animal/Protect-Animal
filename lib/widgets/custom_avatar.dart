import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double? height;
  final double? width;
  final String? image;
  const CustomAvatar({
    Key? key,
    this.height,
    this.width,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 70,
      width: width ?? 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular((height ?? 70) / 2),
        child: Image.network(
            fit: BoxFit.cover,
            image ??
                'https://images.unsplash.com/photo-1503249023995-51b0f3778ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
      ),
    );
  }
}
