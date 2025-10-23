import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:shamel_fibo/features/Auth/data/model/usermodel.dart';
import 'package:shamel_fibo/features/Auth/data/repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Authrepository _auth;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  RegisterCubit(this._auth) : super(RegisterInitial());

  register() async {
    emit(RegisterLoading());
    try {
      final result = await _auth.registerByApi(
        username.text,
        password.text,
        email.text,
        confirmpass.text,
      );
      result.fold((failure) {
        emit(RegisterError(failure.failuremessage));
        clearpasswords();
      }, (user) => emit(RegisterSuccess(user)));
    } catch (e) {
      emit(RegisterError(e.toString()));
      clearpasswords();
    }
  }

  void clearpasswords() {
    password.clear();
    confirmpass.clear();
  }

  void clearcontrollers() {
    email.clear();
    username.clear();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
    password.dispose();
    confirmpass.dispose();
  }
}
