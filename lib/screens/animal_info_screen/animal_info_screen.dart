import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/services/animal_services.dart';

class AnimalInfoScreen extends StatefulWidget {
  const AnimalInfoScreen({super.key});
  @override
  State<AnimalInfoScreen> createState() => _AnimalInfoScreenState();
}

class _AnimalInfoScreenState extends State<AnimalInfoScreen> {
  final String id = Get.arguments;
  late dynamic animal;
  late dynamic characters;
  bool isLoading = true;
  Map<String, String> obj = {'haha': 'ahah', 'hehe': 'eheh'};
  @override
  void initState() {
    getAnimal();

    super.initState();
  }

  getAnimal() async {
    animal = await AnimalServies().getAnimal(id: id);
    isLoading = false;
    print(animal);
    // final arr =
    //     animal['characteristics'].asMap().entries.map((k, v) => print(k + v));
    // print(arr);
    // animal['characteristics'].map((e) => print(e));
    // for (final char in animal['characteristics']) {
    //   print(char);
    // }
    // animal['characteristics'].asMap().forEach((i, value) {
    //   print('index=$i, value=$value');
    // });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: bottomsheetcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.chevron_left,
            color: white,
          ),
        ),
        title: CustomText(text: '${animal['name']}', isTitle: true),
        actions: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(smallPadding),
              height: 50,
              width: 50,
              child: SvgPicture.asset(
                'assets/svgs/bottomNav/map-1.svg',
              ),
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height * 0.4,
                    width: double.infinity,
                    color: white,
                    child: Image.network(
                        fit: BoxFit.cover, '${animal['image'][0]}'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(smallPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Distribution:',
                          textColor: textMediumColor,
                          w: FontWeight.w400,
                        ),
                        const SizedBox(height: smallPadding),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              for (var loc in animal['locations'])
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CustomText(
                                    text: loc,
                                    w: FontWeight.w400,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: smallPadding),
                        Column(
                          children: [
                            for (MapEntry<dynamic, dynamic> entry
                                in animal['characteristics'].entries)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * 0.4,
                                    child: CustomText(
                                      text: '${entry.key} :  ',
                                      textColor: textMediumColor,
                                      w: FontWeight.w400,
                                    ),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      child: CustomText(
                                        text: entry.value,
                                        w: FontWeight.w400,
                                        textColor: white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey, height: 20),
                  Container(
                    padding: const EdgeInsets.all(smallPadding),
                    child: CustomText(
                      text:
                          'The wild boar (Sus scrofa), also known as the wild swine, common wild pig, Eurasian wild pig, or simply wild pig, is a suid native to much of Eurasia and North Africa, and has been introduced to the Americas and Oceania. The species is now one of the widest-ranging mammals in the world, as well as the most widespread suiform. It has been assessed as least concern on the IUCN Red List due to its wide range, high numbers, and adaptability to a diversity of habitats.[1] It has become an invasive species in part of its introduced range. Wild boars probably originated in Southeast Asia during the Early Pleistocene[7] and outcompeted other suid species as they spread throughout the Old World.[8]',
                      textColor: opacityeighty,
                      isLarge: true,
                      w: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
