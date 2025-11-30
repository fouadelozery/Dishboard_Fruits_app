import 'package:cached_network_image/cached_network_image.dart';
import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_product_entity.dart';

class OrderItemProduct extends StatelessWidget {
  final List<OrderProductEntity> products;

  const OrderItemProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Text(
        "No products in this order",
        style: TextStyle(color: Colors.white),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Products",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        ...products.map((product) => _productRow(product)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _productRow(OrderProductEntity product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[200],
            backgroundImage: product.imageUrl.isNotEmpty
                ? CachedNetworkImageProvider(product.imageUrl)
                : null,
            child: product.imageUrl.isEmpty
                ? const Icon(Icons.image_not_supported)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "x${product.quantity}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "\$${(product.price * product.quantity).toStringAsFixed(2)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
