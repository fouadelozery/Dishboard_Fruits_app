import 'package:dartz/dartz.dart';
import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/core/errors/failure.dart';
import 'package:dishboard_fruits_app/core/helper/utiles/endpoint.dart';
import 'package:dishboard_fruits_app/core/services/database_service.dart';
import 'package:dishboard_fruits_app/features/view_order/data/models/order_model.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/repos/order_repo.dart';

class OrderRepoImp implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImp(this.databaseService);

  @override
  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: Endpoint.getOrders,
      )) {
        final list = data as List<dynamic>;

        final orders = list
            .map(
              (item) =>
                  OrderModel.fromJson(item as Map<String, dynamic>).toEntity(),
            )
            .toList();

        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure("Failed to fetch orders: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum state,
    required String orderId,
  }) async {
    try {
      // Safe update — creates document if it doesn't exist
      await databaseService.updataData(
        path: Endpoint.updateOrders,
        id: orderId,
        data: {"status": state.name},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to update order: $e"));
    }
  }
}
