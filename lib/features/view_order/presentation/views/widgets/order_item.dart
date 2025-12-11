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

class OrderItem extends StatefulWidget {
  final OrderEntity order;
  const OrderItem({super.key, required this.order});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool isVisible = true; // Track button visibility

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          setState(() {
            isVisible = false; // Hide buttons after successful update
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Order updated successfully!')),
          );
        } else if (state is UpdateOrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderItemHeader(order: widget.order),
                const SizedBox(height: 16),
                OrderItemShippingInfo(
                  shipping: widget.order.addressingShippingEntity,
                ),
                const SizedBox(height: 16),
                OrderItemProduct(products: widget.order.orderProduct),
                const SizedBox(height: 16),
                OrderItemFooter(
                  totalItems: widget.order.orderProduct.length,
                  totalPrice: widget.order.price,
                ),
                const SizedBox(height: 20),
                if (isVisible)
                  OrderButton(
                    onAccept: () {
                      context.read<UpdateOrderCubit>().updateOrders(
                        status: OrderStatusEnum.accepted,
                        orderId: widget.order.orderId,
                      );
                    },
                    onReject: () {
                      context.read<UpdateOrderCubit>().updateOrders(
                        status: OrderStatusEnum.canceled,
                        orderId: widget.order.orderId,
                      );
                    },
                    isVisible: isVisible,
                  ),
                if (state is UpdateOrderLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
