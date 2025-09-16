import 'dart:io';

import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/is_feature.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custtom_buttom.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/image_field.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  bool isFeature = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.name,
              ),

              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                maxLines: 5,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              IsFeature(
                onchanged: ((value) {
                  isFeature = value;
                }),
              ),
              SizedBox(height: 16),
              ImageField(
                onImagePicked: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 24),
              CusttomButtom(
                text: "Add Product",
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductEntity addProductEntity = AddProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeature: isFeature,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(
          "please choose image",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
