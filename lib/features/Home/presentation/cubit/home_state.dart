part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  ResponseProductsModel response;
  HomeSuccess( this.response);
}

final class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}
