import 'package:dishboard_fruits_app/core/repo/image_repo/image_repo.dart';
import 'package:dishboard_fruits_app/core/repo/product_repo/product_repo.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  AddProductCubit(this.imageRepo, this.productRepo) : super(AddProductInitial());

  Future<void> addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductLoading());
    final uploadResult = await imageRepo.imageUpload(addProductEntity.image);

    uploadResult.fold(
      (failure) => emit(AddProductFailure(errorMessage: failure.message)),
      (url) async {
        addProductEntity.imageUrl = url;

        final productResult = await productRepo.addProduct(addProductEntity);

        productResult.fold(
          (failure) => emit(AddProductFailure(errorMessage: failure.message)),
          (_) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
