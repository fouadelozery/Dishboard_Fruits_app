import 'package:dishboard_fruits_app/features/add_products/presentation/manger/cubits/cubit/add_product_cubit.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custtom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool Function(AddProductState) isLoadingBuilder;
  final VoidCallback onSubmit;

  const SubmitButton({super.key, 
    required this.formKey,
    required this.isLoadingBuilder,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
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
        final bool isLoading = isLoadingBuilder(state);
        return CusttomButtom(
          onPressed: isLoading ? () {} : () { onSubmit(); },
          text: isLoading ? "Adding..." : "Add Product",
        );
      },
    );
  }
}
