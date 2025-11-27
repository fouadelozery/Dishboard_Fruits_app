import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/repos/order_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit(this.orderRepo) : super(FetchOrderInitial());

  final OrderRepo orderRepo;

  Future<void> fetchOrders() async {
    emit(FetchOrderLoading());

    final result = await orderRepo.fetchOrders();

    result.fold(
      (failure) => emit(FetchOrderFailure(errorMesage: failure.message)),
      (ordersList) => emit(FetchOrderSuccess(orders: ordersList)),
    );
  }
}
