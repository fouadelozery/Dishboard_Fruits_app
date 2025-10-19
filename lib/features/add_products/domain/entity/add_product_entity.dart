import 'dart:io';

class AddProductEntity {
  final String name;
  final String code;
  final String description;
 String ? imageUrl;
  final num price;
  final File image;
  final bool isFeature;

  AddProductEntity({required this.name, required this.code, required this.description, this.imageUrl, required this.price, required this.image, required this.isFeature});
  
}
