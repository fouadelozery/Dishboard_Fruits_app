import 'dart:io';

import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/secton_title.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/image_field.dart';
import 'package:flutter/material.dart';

class ImagePickerSection extends StatelessWidget {
  final ValueChanged<File> onImagePicked;

  const ImagePickerSection({super.key, required this.onImagePicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       sectionTitle("Product Image"),
            const SizedBox(height: 16),
            ImageField(onImagePicked: (file) {
              if (file != null) {
                onImagePicked(file);
              }
            }),
          ],
        ),
      ),
    );
  }
}
