import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/utils/routes.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/services/animal_services.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final TextEditingController searchController = TextEditingController();
  late List<dynamic> animals;
  bool isLoading = true;
  @override
  void initState() {
    getAnimals();
    super.initState();
  }

  getAnimals() async {
    animals = await AnimalServies().getAnimals();
    isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: black,
          title: const CustomText(
            text: 'Protect Animal',
            textColor: red,
            isLarge: true,
          ),
          leading: SvgPicture.asset(
            'assets/svgs/reindeer.svg',
            color: red,
          ),
          actions: [
            Center(
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45 / 2),
                  border: Border.all(color: grey, width: 1),
                ),
                child: const Icon(
                  Icons.tune,
                  color: grey,
                ),
              ),
            ),
          ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(smallPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        haveLabel: false,
                        iconLeft: const Icon(
                          Icons.search,
                          color: grey,
                        ),
                        height: 40,
                        inputController: searchController,
                        hintText: 'What animal do you want to find?',
                      ),
                      const SizedBox(height: bigPadding),
                      const CustomText(
                        text: 'Suggestions for you',
                        isMedium: true,
                        w: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: smallPadding,
                      ),
                      ListView.separated(
                        addAutomaticKeepAlives: true,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: animals.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(animalInfoRoute,
                                  arguments: animals[index].id);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(smallPadding),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        '${animals[index].image[0]}'),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: smallPadding),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: animals[index].name,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                            height: extrasmallPadding),
                                        const CustomText(
                                          text:
                                              'Also called wild boar or wild pig, any of the wild members of the pig species Sus scrofa, family Suidae.',
                                          isMedium: true,
                                          w: FontWeight.w400,
                                        ),
                                        const SizedBox(
                                            height: extrasmallPadding),
                                        SizedBox(
                                          height: 20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount:
                                                animals[index].locations.length,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: CustomText(
                                                  text: animals[index]
                                                      .locations[i],
                                                  isMedium: true,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: smallPadding);
                          // return Container();
                        },
                      )
                    ],
                  ),
                ),
              ));
  }
}
