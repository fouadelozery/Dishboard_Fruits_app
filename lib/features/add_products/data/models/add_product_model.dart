import 'dart:io';
import 'package:dishboard_fruits_app/features/add_products/data/models/review_model.dart';
import 'package:dishboard_fruits_app/features/add_products/domain/entity/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final num price;
  final File image;
  final bool isFeature;
  final int expireByMonth;
  bool isOrginic;
  final int numOfCalories;
  num averageRating = 0;
  int ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int countSold;

  AddProductModel({
    required this.expireByMonth,
    required this.numOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeature,
    required this.isOrginic,
    required this.reviews,
    this.countSold = 0,
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
      expireByMonth: entity.expireByMonth,
      numOfCalories: entity.numOfCalories,
      unitAmount: entity.unitAmount,
      isOrginic: entity.isOrginic,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
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
      "expireByMonth": expireByMonth,
      "numOfCalories": numOfCalories,
      "unitAmount": unitAmount,
      "countSold": countSold,
      "isOrginic": isOrginic,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }
}
