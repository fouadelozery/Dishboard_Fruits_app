import 'package:flutter/material.dart';

enum OrderStatusEnum {
  pending,
  accepted,
  rejected,
  delivering,
  delivered,
  canceled,
}

extension OrderEnumColor on OrderStatusEnum {
  Color get color {
    switch (this) {
      case OrderStatusEnum.pending:
        return Colors.orange;
      case OrderStatusEnum.accepted:
        return Colors.blue;
      case OrderStatusEnum.rejected:
        return Colors.red;
      case OrderStatusEnum.delivering:
        return Colors.purple;
      case OrderStatusEnum.delivered:
        return Colors.green;
      case OrderStatusEnum.canceled:
        return Colors.grey; // Added a default color for canceled
    }
  }
}
