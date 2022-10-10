import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_Inkwell.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';
import 'package:protectanimal/widgets/custom_text_field.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<XFile> _imageFileList = [];
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
          title: const CustomText(
            text: 'Add New Post',
            isLarge: true,
            textColor: white,
          ),
        ),
        backgroundColor: black,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(Dimentsions().ten),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Photos',
                  textColor: white,
                  isMedium: true,
                ),
                CustomInkWell(
                  onTap: () => {pickImages()},
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: black,
                        borderRadius:
                            BorderRadius.circular(Dimentsions().eighteen)),
                    padding: EdgeInsets.all(Dimentsions().twelve),
                    width: double.infinity,
                    child: DottedBorder(
                      color: white,
                      dashPattern: [
                        Dimentsions().six,
                        Dimentsions().six,
                        Dimentsions().six,
                        Dimentsions().six
                      ],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(Dimentsions().sixteen),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.photo_camera,
                              color: white,
                            ),
                            SizedBox(width: Dimentsions().four),
                            const CustomText(
                              text: '0/10',
                              textColor: white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                    inputController: titleController, hintText: 'Title...'),
                SizedBox(height: Dimentsions().sixteen),
                CustomTextField(
                    inputController: descriptionController,
                    hintText: 'Description'),
                Flexible(flex: 1, child: Container()),
                CustomButton(
                  text: 'Post',
                  onTap: () {
                    print('new post');
                  },
                )
              ],
            ),
          ),
        ));
  }

  pickImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      _imageFileList.addAll(selectedImages);
    }
    print(selectedImages.length.toString());
  }
}
