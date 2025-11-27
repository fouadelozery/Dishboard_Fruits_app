import 'package:dishboard_fruits_app/features/add_products/presentation/views/add_product_view.dart';
import 'package:dishboard_fruits_app/features/dishboard/presentation/views/dishboard_view.dart';
import 'package:dishboard_fruits_app/features/view_order/presentation/views/order_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DishboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DishboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductView());
    case OrderView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
