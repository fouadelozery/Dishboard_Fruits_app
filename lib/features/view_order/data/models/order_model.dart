import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/features/view_order/data/models/addressing_shipping_model.dart';
import 'package:dishboard_fruits_app/features/view_order/data/models/order_product_model.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';

class OrderModel {
  final double price;
  final String uId;
  final AddressingShippingModel addressingShippingModel;
  final List<OrderProductModel> orderProduct;
  final String payMethods;
  final String status;
  final String orderId; // ✔ Fixed naming

  OrderModel({
    required this.price,
    required this.uId,
    required this.addressingShippingModel,
    required this.orderProduct,
    required this.payMethods,
    required this.status,
    required this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      price: (json['price'] as num).toDouble(),
      uId: json['uId'] ?? "",
      addressingShippingModel: AddressingShippingModel.fromJson(
        json['addressingShippingModel'],
      ),
      orderProduct: (json['orderProduct'] as List)
          .map((item) => OrderProductModel.fromJson(item))
          .toList(),
      payMethods: json['payMethods'] ?? "",
      status: json['status'] ?? "pending",
      orderId: json['orderId'] ?? "", // ✔ Added
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'uId': uId,
      'status': status,
      'orderId': orderId, // ✔ Added
      'addressingShippingModel': addressingShippingModel.toJson(),
      'orderProduct': orderProduct.map((p) => p.toJson()).toList(),
      'payMethods': payMethods,
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      price: price,
      uId: uId,
      addressingShippingEntity: addressingShippingModel.toEntity(),
      orderProduct: orderProduct.map((p) => p.toEntity()).toList(),
      payMethods: payMethods,
      orderId: orderId, // ✔ Added
      status: OrderStatusEnum.values.firstWhere(
        (e) => e.name == status,
        orElse: () => OrderStatusEnum.pending,
      ),
    );
  }
}
