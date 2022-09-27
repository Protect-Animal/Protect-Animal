import 'package:flutter/material.dart';
import 'package:protectanimal/widgets/custom_post.dart';
class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const CustomPost();
      },
    );
  }
}
