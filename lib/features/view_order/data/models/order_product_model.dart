import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final String code;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'code': code,
      'price': price,
      'quantity': quantity,
    };
  }

  /// Convert to domain entity
  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      imageUrl: imageUrl,
      code: code,
      price: price,
      quantity: quantity,
    );
  }

  /// Null-safe fromJson
  factory OrderProductModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return OrderProductModel.empty();
    return OrderProductModel(
      name: json['name'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      code: json['code'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      quantity: (json['quantity'] ?? 0).toInt(),
    );
  }

  /// Empty fallback model
  factory OrderProductModel.empty() => OrderProductModel(
    name: "",
    imageUrl: "",
    code: "",
    price: 0,
    quantity: 0,
  );
}
