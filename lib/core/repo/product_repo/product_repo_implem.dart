

import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/core/helper/utiles/endpoint.dart';
import 'package:dishboard_fruits_app/core/repo/product_repo/product_repo.dart';
import 'package:dishboard_fruits_app/core/services/database_service.dart';
import 'package:dishboard_fruits_app/features/add_products/data/models/add_product_model.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';

class ProductRepoImplem implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImplem(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(AddProductEntity addProductEntity) async {
    try {
      print(" ${addProductEntity.imageUrl}");
      print(": ${Endpoint.addProduct}");

      await databaseService.addData(
        path: Endpoint.addProduct,
        data: AddProductModel.fromEntity(addProductEntity).toJson(),
      );

      print(" Product saved successfully");
      return right(null);
    } catch (e, stacktrace) {
      print(" Error adding product: $e");
      print(stacktrace);
      return left(ServerFailure("Failed to add product: ${e.toString()}"));
    }
  }
}
