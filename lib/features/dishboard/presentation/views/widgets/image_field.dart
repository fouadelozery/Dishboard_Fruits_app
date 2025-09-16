import 'dart:io';

import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImagePicked});
  final ValueChanged<File?> onImagePicked;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickImage();
          } catch (e) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: fileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.file(fileImage!),
                      )
                    : Icon(
                        Icons.image_outlined,
                        color: AppColors.primaryColor,
                        size: 180,
                      ),
              ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    widget.onImagePicked(fileImage);
                  });
                },
                icon: Icon(Icons.delete, size: 30),
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    fileImage = File(image!.path);
    widget.onImagePicked(fileImage);
    setState(() {});
  }
}
