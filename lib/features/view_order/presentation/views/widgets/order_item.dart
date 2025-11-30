import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/view_order/cubits/update_orders/update_order_cubit.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_buttom.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_item_footer.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_item_header.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_item_products.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_item_shipping_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderItemHeader(order: order),
            const SizedBox(height: 16),
            OrderItemShippingInfo(shipping: order.addressingShippingEntity),
            const SizedBox(height: 16),
            OrderItemProduct(products: order.orderProduct),
            const SizedBox(height: 16),
            OrderItemFooter(
              totalItems: order.orderProduct.length,
              totalPrice: order.price,
            ),
            OrderButton(
              onAccept: () {
                context.read<UpdateOrderCubit>().updateOrders(
                  status: OrderStatusEnum.accepted,
                  orderId: order.orderId,
                );
              },
              onReject: () {
                context.read<UpdateOrderCubit>().updateOrders(
                  status: OrderStatusEnum.canceled,
                  orderId: order.orderId,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
