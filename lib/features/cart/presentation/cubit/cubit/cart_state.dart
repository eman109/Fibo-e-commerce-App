part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartModel cartmodel;
  CartSuccess(this.cartmodel);
}

final class CartError extends CartState {
  final String message;
  CartError(this.message);
}

final class cartAdding extends CartState {}
final class cartAddingSuccess extends CartState {
  final CartModel cartmodel;
  cartAddingSuccess(this.cartmodel);
}
final class cartAddingFailure extends CartState {
  final String message;
  cartAddingFailure(this.message);
}
