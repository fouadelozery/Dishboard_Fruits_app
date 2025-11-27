import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';

class FiltterSection extends StatelessWidget {
  const FiltterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.filter_b_and_w_sharp)),
        Text(
          "filter",
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 22,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
