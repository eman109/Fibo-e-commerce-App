part of 'logincubit_cubit.dart';

@immutable
sealed class LogincubitState {}

final class LogincubitInitial extends LogincubitState {}

final class LogincubitLoading extends LogincubitState {}

final class LogincubitSuccess extends LogincubitState {
  Usermodel user;
  LogincubitSuccess(this.user);
}

final class LogincubitError extends LogincubitState {
  String error;
  LogincubitError(this.error);
}

