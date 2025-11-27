import 'package:dishboard_fruits_app/features/view_order/data/models/addressing_shipping_model.dart';
import 'package:dishboard_fruits_app/features/view_order/data/models/order_product_model.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';

class OrderModel {
  final double price;
  final String uId;
  final AddressingShippingModel addressingShippingModel;
  final List<OrderProductModel> orderProduct;
  final String payMethods;

  OrderModel({
    required this.price,
    required this.uId,
    required this.addressingShippingModel,
    required this.orderProduct,
    required this.payMethods,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      price: (json['price'] as num).toDouble(),
      uId: json['uId'],
      addressingShippingModel: AddressingShippingModel.fromJson(
        json['addressingShippingModel'],
      ),
      orderProduct: (json['orderProduct'] as List)
          .map((item) => OrderProductModel.fromJson(item))
          .toList(),
      payMethods: json['payMethods'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'uId': uId,
      "states": "pending",
      "data": DateTime.now().toString(),
      'addressingShippingModel': addressingShippingModel.toJson(),
      'orderProduct': orderProduct.map((product) => product.toJson()).toList(),
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
    );
  }
}
