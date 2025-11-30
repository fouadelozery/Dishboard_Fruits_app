import 'package:dartz/dartz.dart';
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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var (result as List<Map<String, dynamic>>)
          in databaseService.streamData(path: Endpoint.getOrders)) {
        final orders = (result as List)
            .map((json) => OrderModel.fromJson(json).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure("Failed to fetch orders: $e"));
    }
  }
}
