import 'package:flutter/material.dart';
import 'package:protectanimal/main.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_avatar.dart';
import 'package:protectanimal/widgets/custom_text.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAvatar(height: 48, width: 48, image: 'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(text: 'Cameron Williamson'),
                        Container(
                          margin: const EdgeInsets.all(smallPadding),
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        CustomText(
                          w: FontWeight.w500,
                          text: 'Just now',
                          textColor: textMediumColor,
                        )
                      ],
                    ),
                    const CustomText(
                      text: 'Call me tanuki one more time',
                      isMedium: true,
                      w: FontWeight.w500,
                    ),
                    CustomText(text: '#Victorya island #Vulpes lagopus'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: smallPadding),
          Container(
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallPadding)),
            child: Image.network(
                fit: BoxFit.cover,
                'https://images.unsplash.com/photo-1470093851219-69951fcbb533?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c25vdyUyMGZveHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
          ),
          Divider(color: textMediumColor),
        ],
      ),
    );
  }
}
