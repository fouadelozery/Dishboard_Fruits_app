import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductEntity addProductEntity);
}
