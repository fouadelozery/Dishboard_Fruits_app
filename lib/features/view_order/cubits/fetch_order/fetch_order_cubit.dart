import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/entities/order_entity.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/repos/order_repo.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit(this.orderRepo) : super(FetchOrderInitial());

  final OrderRepo orderRepo;
  StreamSubscription? streamSubscription;

  void fetchOrders() {
    emit(FetchOrderLoading());

    streamSubscription?.cancel();

    streamSubscription = orderRepo.fetchOrders().listen(
      (result) {
        result.fold(
          (failure) => emit(FetchOrderFailure(errorMesage: failure.message)),
          (orders) => emit(FetchOrderSuccess(orders: orders)),
        );
      },
      onError: (error) =>
          emit(FetchOrderFailure(errorMesage: error.toString())),
    );
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
