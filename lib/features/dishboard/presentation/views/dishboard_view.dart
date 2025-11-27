import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/dishboard_view_body.dart';
import 'package:flutter/material.dart';

class DishboardView extends StatelessWidget {
  const DishboardView({super.key});
  static const routeName = 'dishboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dishboard View',
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 22,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: DishboardViewBody()),
    );
  }
}
