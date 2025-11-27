import 'dart:ui';

import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
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
        Row(
          children: [
            const Icon(Icons.receipt_long, color: Colors.blue),
            const SizedBox(width: 6),
            Text(
              "Order:${order.uId}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                fontFamily: "Cairo",
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: order.payMethods == "cach"
                ? Colors.green[100]
                : Colors.blue[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            order.payMethods == "cach" ? "Cash" : "Online",
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
