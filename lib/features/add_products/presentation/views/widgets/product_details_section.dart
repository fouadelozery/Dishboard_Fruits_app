import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/secton_title.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final FormFieldSetter<String> onSavedName;
  final FormFieldSetter<String> onSavedCode;
  final FormFieldSetter<String> onSavedDescription;
  final FormFieldSetter<String> onSavedExpire;
  final FormFieldSetter<String> onSavedCalories;
  final FormFieldSetter<String> onSavedUnit;
  final FormFieldSetter<String> onSavedPrice;

  const ProductDetails({super.key, 
    required this.onSavedName,
    required this.onSavedCode,
    required this.onSavedDescription,
    required this.onSavedExpire,
    required this.onSavedCalories,
    required this.onSavedUnit,
    required this.onSavedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          sectionTitle("Product Details"),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedName,
              hintText: 'Product Name',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedPrice,
              hintText: 'Product Price',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedCode,
              hintText: 'Product Code',
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedExpire,
              hintText: 'Expire By Month',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedCalories,
              hintText: 'Number Of Calories',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedUnit,
              hintText: 'Unit Amount',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: onSavedDescription,
              hintText: 'Product Description',
              maxLines: 5,
              textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
