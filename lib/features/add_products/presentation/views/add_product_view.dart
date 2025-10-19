import 'package:dishboard_fruits_app/core/repo/image_repo/image_repo.dart';
import 'package:dishboard_fruits_app/core/repo/product_repo/product_repo.dart';
import 'package:dishboard_fruits_app/core/services/get_it.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/manger/cubits/cubit/add_product_cubit.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = '/addProductView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Cairo",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImageRepo>(),
            getIt.get<ProductRepo>(),
        ),
        child: SafeArea(child: AddProductViewBody()),
      ),
    );
  }
}
