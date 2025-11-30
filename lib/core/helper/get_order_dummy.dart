import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/addressing_shipping_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_product_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';

OrderEntity getDummyOrder() {
  final addressingShippingEntity = AddressingShippingEntity(
    fullName: "Alice Johnson",
    phoneNumber: "+1234567890",
    email: "alice.johnson@example.com",
    address: "456 Elm Street",
    city: "Los Angeles",
    floor: "3",
    addressDetails: "Near Sunset Boulevard",
  );

  final orderProducts = [
    OrderProductEntity(
      name: "Apple",
      imageUrl:
          "https://thumbs.dreamstime.com/b/red-apple-isolated-clipping-path-19130134.jpg",
      code: "APL001",
      price: 50.25,
      quantity: 2,
    ),
    OrderProductEntity(
      name: "Banana",
      imageUrl:
          "https://thumbs.dreamstime.com/b/red-apple-isolated-clipping-path-19130134.jpg",
      code: "BAN002",
      price: 30.50,
      quantity: 3,
    ),
    OrderProductEntity(
      name: "Orange",
      imageUrl:
          "https://thumbs.dreamstime.com/b/red-apple-isolated-clipping-path-19130134.jpg",
      code: "ORG003",
      price: 40.00,
      quantity: 1,
    ),
    OrderProductEntity(
      name: "Mango",
      imageUrl:
          "https://thumbs.dreamstime.com/b/red-apple-isolated-clipping-path-19130134.jpg",
      code: "MAN004",
      price: 70.00,
      quantity: 1,
    ),
  ];

  return OrderEntity(
    price: 320.75,
    uId: "ORD20251126",
    addressingShippingEntity: addressingShippingEntity,
    orderProduct: orderProducts,
    payMethods: "online",
    status: OrderStatusEnum.accepted,
  );
}
