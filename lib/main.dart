import 'package:dishboard_fruits_app/core/helper/on_generate_function.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/dishboard_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DishboardView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
