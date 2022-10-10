import 'package:flutter/material.dart';
import 'package:protectanimal/models/animal.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_avatar.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';

class BottomSheetMap extends StatelessWidget {
  const BottomSheetMap({super.key, required this.animal});
  final Animal animal;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
        decoration: BoxDecoration(
            color: bottomsheetcolor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView(
          controller: scrollController,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  top: 15,
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: smallPadding),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(smallPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: animal.name,
                                      size: 20,
                                    ),
                                    const SizedBox(height: smallPadding),
                                    SizedBox(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: animal.locations.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: CustomText(
                                              text: animal.locations[index],
                                              isMedium: true,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.cloud, color: white),
                                    SizedBox(width: extrasmallPadding),
                                    CustomText(text: '17C')
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: extrasmallPadding),
                            Row(
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.directions_car, color: white),
                                    SizedBox(width: extrasmallPadding),
                                    CustomText(
                                      text: '24KM',
                                      w: FontWeight.w400,
                                      isMedium: true,
                                    )
                                  ],
                                ),
                                const SizedBox(width: extrasmallPadding),
                                Row(
                                  children: const [
                                    Icon(Icons.favorite_outline, color: white),
                                    SizedBox(width: extrasmallPadding),
                                    CustomText(
                                      text: 'Loved',
                                      w: FontWeight.w400,
                                      isMedium: true,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: smallPadding),
                            SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: animal.image.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(4.0),
                                    width: 88,
                                    height: 88,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      child: Image.network(
                                          fit: BoxFit.cover,
                                          animal.image[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: smallPadding),
                            CustomButton(text: 'I want more information'),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: textFldBorderColor,
                    ),
                    ListTile(
                      leading: CustomAvatar(
                          height: 48,
                          width: 48,
                          image:
                              'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                      title: Row(
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
                      subtitle: const CustomText(
                        text:
                            'Look at those ears and that neck things a bruiser! I cannot imagine seeing something like that living in NJ were lucky if traffic doesn’t get anything over a few years old at least by me!',
                        isMedium: true,
                        w: FontWeight.w500,
                      ),
                    ),
                    ListTile(
                      leading: CustomAvatar(
                          height: 48,
                          width: 48,
                          image:
                              'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                      title: Row(
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
                      subtitle: const CustomText(
                        text:
                            'Look at those ears and that neck things a bruiser! I cannot imagine seeing something like that living in NJ were lucky if traffic doesn’t get anything over a few years old at least by me!',
                        isMedium: true,
                        w: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
