import 'dart:io';
import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/manger/cubits/cubit/add_product_cubit.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/image_packer_section.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/is_feature.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/is_organic.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/option_section.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/product_details_section.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/submit_buttom.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custtom_buttom.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expireByMonth, numOfCalories, unitAmount;
  bool isFeature = false;
  bool isOrganic = true;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetails(
              onSavedName: (v) => name = v!,
              onSavedPrice: (v) => price = num.parse(v!),
              onSavedCode: (v) => code = v!.toLowerCase(),
              onSavedExpire: (v) => expireByMonth = num.parse(v!),
              onSavedCalories: (v) => numOfCalories = num.parse(v!),
              onSavedUnit: (v) => unitAmount = num.parse(v!),
              onSavedDescription: (v) => description = v!,
            ),
            const SizedBox(height: 20),
            OptionsSection(
              onFeatureChanged: (v) => isFeature = v,
              onOrganicChanged: (v) => isOrganic = v,
            ),
            const SizedBox(height: 20),
            ImagePickerSection(
              onImagePicked: (img) => image = img,
            ),
            const SizedBox(height: 30),
            SubmitButton(
              formKey: formKey,
              isLoadingBuilder: (state) => state is AddProductLoading,
              onSubmit: () {
                if (formKey.currentState!.validate()) {
                  if (image == null) {
                    _showError(context);
                    return;
                  }
                  formKey.currentState!.save();
                  final entity = AddProductEntity(
                    name: name,
                    code: code,
                    description: description,
                    price: price,
                    expireByMonth: expireByMonth.toInt(),
                    numOfCalories: numOfCalories.toInt(),
                    unitAmount: unitAmount.toInt(),
                    image: image!,
                    isFeature: isFeature,
                    isOrganic: isOrganic,
                  );
                  context.read<AddProductCubit>().addProduct(entity);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(
          "Please choose an image",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
