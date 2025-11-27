import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/addressing_shipping_entity.dart';

class OrderItemShippingInfo extends StatelessWidget {
  const OrderItemShippingInfo({super.key, required this.shipping});
  final AddressingShippingEntity shipping;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Shipping Information",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        row("Name", shipping.fullName),
        row("Phone", shipping.phoneNumber),
        row(
          "Address",
          "${shipping.address}, ${shipping.city ?? ""}, Floor ${shipping.floor ?? ""}",
        ),
      ],
    );
  }

  Widget row(String title, String? value) {
    if (value == null || value.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
