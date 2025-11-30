import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/repos/order_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit(this.orderRepo) : super(FetchOrderInitial());

  final OrderRepo orderRepo;

  void fetchOrders() async {
    emit(FetchOrderLoading());

    await for (var result in orderRepo.fetchOrders()) {
      result.fold(
        // LEFT = Failure
        (failure) => emit(FetchOrderFailure(errorMesage: failure.message)),
        // RIGHT = List<OrderEntity>
        (orders) => emit(FetchOrderSuccess(orders: orders)),
      );
    }
  }
}
