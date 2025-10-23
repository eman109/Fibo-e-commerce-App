import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:shamel_fibo/features/Auth/data/model/usermodel.dart';
import 'package:shamel_fibo/features/Auth/data/repository/auth_repository.dart';

part 'logincubit_state.dart';

class LogincubitCubit extends Cubit<LogincubitState> {
  final Authrepository _auth;

  LogincubitCubit(this._auth) : super(LogincubitInitial());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    emit(LogincubitLoading());
    try {
      final result = await _auth.loginUserByApi(username.text, password.text);
      result.fold(
        (failure) => emit(LogincubitError(failure.failuremessage)),
        (user) => emit(LogincubitSuccess(user)),
      );
    } catch (e) {
      emit(LogincubitError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
    username.dispose();
    password.dispose();
  }
}

