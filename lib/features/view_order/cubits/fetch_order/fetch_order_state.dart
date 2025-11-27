part of 'fetch_order_cubit.dart';

@immutable
sealed class FetchOrderState {}

final class FetchOrderInitial extends FetchOrderState {}

final class FetchOrderLoading extends FetchOrderState {}

final class FetchOrderSuccess extends FetchOrderState {
  final List<OrderEntity> orders;

  FetchOrderSuccess({required this.orders});
}

final class FetchOrderFailure extends FetchOrderState {
  final String errorMesage;

  FetchOrderFailure({required this.errorMesage});
}
