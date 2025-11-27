import 'package:dishboard_fruits_app/features/add_products/presentation/views/add_product_view.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custtom_buttom.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/order_view.dart';
import 'package:flutter/material.dart';

class DishboardViewBody extends StatelessWidget {
  const DishboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CusttomButtom(
            text: "Add Data ",
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),

          SizedBox(height: 20),
          CusttomButtom(
            text: "View Order ",
            onPressed: () {
              Navigator.pushNamed(context, OrderView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
