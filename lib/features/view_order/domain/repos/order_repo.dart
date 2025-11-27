import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();
}
