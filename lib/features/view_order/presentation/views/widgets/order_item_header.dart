import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';

class OrderItemHeader extends StatelessWidget {
  const OrderItemHeader({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              const Icon(Icons.receipt_long, color: Colors.blue),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  "Order: ${order.uId.length > 7 ? order.uId.substring(0, 7) : order.uId}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "Cairo",
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.blue[500],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            order.status.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
