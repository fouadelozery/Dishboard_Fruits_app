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
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final result = await databaseService.getData(path: Endpoint.getOrders);

      List<OrderEntity> orders =
          (result as List<dynamic>)
                  .map((e) => OrderModel.fromJson(e).toEntity())
                  .toList()
              as List<OrderEntity>;

      return Right(orders);
    } catch (e) {
      return Left(ServerFailure("failed to fetch orders"));
    }
  }
}
