class OrderProductEntity {
  final String name;
  final String imageUrl;
  final String code;
  final num price;
  final int quantity;

  OrderProductEntity({
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });
}
