import 'package:dishboard_fruits_app/features/add_products/presentation/views/add_product_view.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/custtom_buttom.dart';
import 'package:flutter/material.dart';

class DishboardViewBody extends StatelessWidget {
  const DishboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CusttomButtom(
            text: "add data ",
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
