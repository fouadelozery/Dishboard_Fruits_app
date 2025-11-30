import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/core/services/get_it.dart';
import 'package:dishboard_fruits_app/features/view_order/cubits/fetch_order/fetch_order_cubit.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/repos/order_repo.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_view_body.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const routeName = "orders";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order",
            style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 22,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: OrderViewBodyBlocBuilder(),
      ),
    );
  }
}
