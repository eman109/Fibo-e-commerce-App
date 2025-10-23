import 'package:dartz/dartz.dart';
import 'package:shamel_fibo/core/network/failures.dart';
import 'package:shamel_fibo/features/Auth/data/model/usermodel.dart';

abstract class Authrepository {
  Future<Either<Failures, Usermodel>> loginUserByApi(
    String username,
    String password,
  );
  Future<Either<Failures, Usermodel>> registerByApi(
    String username,
    String password,
    String email,String confirmpass
  );
  }
