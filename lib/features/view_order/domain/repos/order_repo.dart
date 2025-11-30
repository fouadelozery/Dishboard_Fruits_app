import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
  Future<Either<Failure, void>> uodateOrder({
    required OrderStatusEnum state,
    required String orderId,
  });
}
