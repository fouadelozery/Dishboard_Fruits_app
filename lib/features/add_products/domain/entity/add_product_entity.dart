import 'dart:io';

class AddProductEntity {
  final String name;
  final String code;
  final String description;
  String? imageUrl;
  final num price;
  final File image;
  final bool isFeature;
  final int expireByMonth;
  bool isOrginic = true;
  final int numOfCalories;
  num averageRating = 0;
  int ratingCount = 0;
  final int unitAmount;

  AddProductEntity({
    required this.expireByMonth,
    required this.numOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.image,
    required this.isFeature, required bool isOrganic,
  });
}
