import 'dart:io';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final num price;
  final File image;
  final bool isFeature;

  AddProductModel({
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeature,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      imageUrl: entity.imageUrl,
      price: entity.price,
      image: entity.image,
      isFeature: entity.isFeature,
    );
  }

Map<String, dynamic> toJson() {
  return {
    "name": name,
    "code": code,
    "description": description,
    "price": price,
    "imageUrl": imageUrl, 
    "isFeature": isFeature,
  };
}

}
