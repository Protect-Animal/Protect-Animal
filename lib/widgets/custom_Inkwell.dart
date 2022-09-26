import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';

class CustomInkWell extends StatefulWidget {
  final Widget child;
  final Color? color;
  final Function()? onTap;
  const CustomInkWell({super.key, required this.child, this.onTap, this.color});

  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Colors.grey.withOpacity(0.3);
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: color,
            highlightColor: color,
            borderRadius: BorderRadius.circular(textSmallSize),
            onTap: widget.onTap,
          ),
        )),
      ],
    );
  }
}
