import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';
import 'package:shamel_fibo/core/network/failures.dart';
import 'package:shamel_fibo/features/Auth/data/model/usermodel.dart';
import 'package:shamel_fibo/features/Auth/data/repository/auth_repository.dart';

class AuthrepoImplemen implements Authrepository {
  Apiconsumer apiconsumer;
  AuthrepoImplemen(this.apiconsumer);

  @override
  Future<Either<Failures, Usermodel>> loginUserByApi(
    String username,
    String password,
  ) async {
    try {
      final data = await apiconsumer.post("https://dummyjson.com/auth/login", {
        "username": username,
        "password": password,
      },options:Options());
      final user = Usermodel.fromJson(data as Map<String, dynamic>);
      return Future.value(Right(user));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(Serverfailure.fromDioException(e)));
      }
      return Future.value(left(Serverfailure(e.toString())));
    }
  }

  @override
  Future<Either<Failures, Usermodel>> registerByApi(
    String username,
    String password,
    String email,String confirmpass
  ) async {
    try {
      final data = await apiconsumer.post("https://dummyjson.com/users/add", {
        "username": username,
        "password": password,
        "email":email,
        "confirmpass":confirmpass

      });
      final user = Usermodel.fromJson(data as Map<String, dynamic>);
      return Future.value(Right(user));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(Serverfailure.fromDioException(e)));
      }
      return Future.value(left(Serverfailure(e.toString())));
    }
  }
}
