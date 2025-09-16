import 'package:dishboard_fruits_app/features/dishboard/presentation/views/widgets/dishboard_view_body.dart';
import 'package:flutter/material.dart';

class DishboardView extends StatelessWidget {
  const DishboardView({super.key});
  static const routeName = 'dishboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dishboard View')),
      body: DishboardViewBody(),
    );
  }
}
