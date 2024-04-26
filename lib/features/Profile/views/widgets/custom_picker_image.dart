import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:path/path.dart';

class CustomPickerImages extends StatefulWidget {
  const CustomPickerImages({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);
  final void Function(File?, String?) onImageSelected;

  @override
  State<CustomPickerImages> createState() => _CustomPickerImagesState();
}

class _CustomPickerImagesState extends State<CustomPickerImages> {
  File? imageFile;
  String? imageName;

  Widget? checkImage() {
    if (imageFile == null) {
      return const Icon(Icons.add_a_photo_outlined);
    } else {
      return Image.file(fit: BoxFit.cover, File(imageFile!.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 140,
        height: 140,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: kSecondary2),
              color: kSecondary,
              borderRadius: BorderRadius.circular(90)),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: InkWell(
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                    },
                    child: checkImage())),
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
        imageName = basename(file.path);
      });
      widget.onImageSelected(imageFile, imageName);
    }
  }
}
