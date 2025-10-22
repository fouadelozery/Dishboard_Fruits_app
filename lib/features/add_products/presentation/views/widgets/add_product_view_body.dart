import 'dart:io';
import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/review_entity.dart';
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
            ImagePickerSection(onImagePicked: (img) => image = img),
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
                    reviews: [ReviewEntity(reviewerName: "fouad", comment: "good", rating: 5, reviewDate: DateTime.now().toString(), imageUrl: "data:image/jpeg;base64,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")],
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
