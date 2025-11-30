import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/addressing_shipping_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_product_entity.dart';

class OrderEntity {
  final double price;
  final String uId;
  final AddressingShippingEntity addressingShippingEntity;
  final List<OrderProductEntity> orderProduct;
  final String payMethods;
  final OrderStatusEnum status;
  final String orderId;

  OrderEntity({
    required this.price,
    required this.uId,
    required this.addressingShippingEntity,
    required this.orderProduct,
    required this.payMethods,
    required this.status,
    required this.orderId,
  });
}
