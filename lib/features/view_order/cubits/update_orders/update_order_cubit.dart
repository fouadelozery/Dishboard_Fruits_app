import 'package:bloc/bloc.dart';
import 'package:dishboard_fruits_app/core/e_num/order_enum.dart';
import 'package:dishboard_fruits_app/features/view_order/domain/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderRepo) : super(UpdateOrderInitial());

  final OrderRepo orderRepo;

  Future<void> updateOrders({
    required OrderStatusEnum status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());

    final result = await orderRepo.updateOrder(state: status, orderId: orderId);

    result.fold(
      (failure) => emit(UpdateOrderFailure(errorMessage: failure.message)),
      (_) => emit(UpdateOrderSuccess()),
    );
  }
}
