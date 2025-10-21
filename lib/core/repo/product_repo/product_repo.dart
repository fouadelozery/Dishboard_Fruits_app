import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';

 abstract class ProductRepo {
  Future<Either<Failure,void>> addProduct(AddProductEntity addProductEntity);
}
