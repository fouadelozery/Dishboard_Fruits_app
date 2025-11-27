import 'package:dishboard_fruits_app/core/helper/get_order_dummy.dart';
import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/filter_section.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_item.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/widgets/order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            FiltterSection(),
            SizedBox(height: 16),
            Expanded(
              child: OrdersListView(
                orders: [getDummyOrder(), getDummyOrder(), getDummyOrder()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
