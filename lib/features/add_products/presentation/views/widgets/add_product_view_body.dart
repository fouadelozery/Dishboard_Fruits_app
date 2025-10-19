import 'dart:io';

import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/manger/cubits/cubit/add_product_cubit.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/is_feature.dart';
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card: Product Info
              Card(
                shadowColor: Colors.black,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle("Product Details"),
                      const SizedBox(height: 16),
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
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle("Options"),
                      const SizedBox(height: 8),
                      IsFeature(
                        onchanged: ((value) {
                          isFeature = value;
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle("Product Image"),
                      const SizedBox(height: 16),
                      ImageField(
                        onImagePicked: (image) {
                          this.image = image;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
// ... inside _AddProductViewBodyState

// Replace the original SizedBox and CusttomButtom with the following BlocConsumer:
SizedBox(
  width: double.infinity,
  child: BlocConsumer<AddProductCubit, AddProductState>(
    listener: (context, state) {
      if (state is AddProductFailure) {
        // ... (Your error SnackBar logic is correct)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      } else if (state is AddProductSuccess) {
        // ... (Your success SnackBar and navigation logic is correct)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Product added successfully",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        Navigator.pop(context);
      }
    },
    builder: (context, state) {
      // 🎯 CRITICAL FIX HERE: Check for Loading state
   final bool isLoading = state is AddProductLoading;

return CusttomButtom(
  onPressed: () {
    if (isLoading) return;
    if (formKey.currentState!.validate()) {
      if (image == null) {
        showError(context);
        return;
      }
      formKey.currentState!.save();
      final entity = AddProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        image: image!,
        isFeature: isFeature,
      );
      context.read<AddProductCubit>().addProduct(entity);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  },
  text: isLoading ? "Adding..." : "Add Product",
);

  },
  ),
), ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }

  void showError(BuildContext context) {
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
