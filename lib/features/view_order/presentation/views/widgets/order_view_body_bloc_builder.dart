import 'package:dishboard_fruits_app/core/helper/get_order_dummy.dart';
import 'package:dishboard_fruits_app/features/view_order/cubits/fetch_order/fetch_order_cubit.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderViewBodyBlocBuilder extends StatefulWidget {
  const OrderViewBodyBlocBuilder({super.key});

  @override
  State<OrderViewBodyBlocBuilder> createState() =>
      _OrderViewBodyBlocBuilderState();
}

class _OrderViewBodyBlocBuilderState extends State<OrderViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrderCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrderCubit, FetchOrderState>(
      builder: (context, state) {
        if (state is FetchOrderSuccess) {
          return OrderViewBody(orders: state.orders);
        } else if (state is FetchOrderFailure) {
          return Center(child: Text(state.errorMesage));
        } else {
          return Skeletonizer(
            child: OrderViewBody(
              orders: [getDummyOrder(), getDummyOrder(), getDummyOrder()],
            ),
          );
        }
      },
    );
  }
}
