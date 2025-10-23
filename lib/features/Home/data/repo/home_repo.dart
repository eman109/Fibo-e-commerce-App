import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';
import 'package:shamel_fibo/core/network/failures.dart';
import 'package:shamel_fibo/features/Home/data/models/response_products_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, ResponseProductsModel>> getAllProducts();
}

class HomeRepoImpl implements HomeRepo {
  Apiconsumer apiconsumer;
  HomeRepoImpl(this.apiconsumer);
  @override
  Future<Either<Failures, ResponseProductsModel>> getAllProducts() async {
    try {
      final data = await apiconsumer.get("https://dummyjson.com/products");
      return Future.value(Right(ResponseProductsModel.fromJson(data)));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(Serverfailure.fromDioException(e)));
      }
      return Future.value(left(Serverfailure(e.toString())));
    }
  }
}

