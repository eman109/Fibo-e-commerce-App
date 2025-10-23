import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';
import 'package:shamel_fibo/core/network/failures.dart';
import 'package:shamel_fibo/features/cart/data/model/cart_model.dart';

abstract class Cartrepo {
  Future<Either<Failures, CartModel>> getCart();
  Future<Either<Failures, CartModel>> addProduct(int id, int quantity);
}

class CartRepoImpl implements Cartrepo {
  Apiconsumer apiconsumer;
  CartRepoImpl(this.apiconsumer);
  @override
  Future<Either<Failures, CartModel>> getCart() async {
    try {
      final data = await apiconsumer.get("https://dummyjson.com/carts/1");
      return Future.value(right(CartModel.fromJson(data)));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(Serverfailure.fromDioException(e)));
      }
      return Future.value(left(Serverfailure(e.toString())));
    }
  }

  @override
  Future<Either<Failures, CartModel>> addProduct(int id, int quantity) async {
    try {
      final data = await apiconsumer.put("https://dummyjson.com/carts/1", {
        "merge": true,
        "products": [
          {
            "id": id,
            "quantity": quantity,
          },
        ],
      });
      return Future.value(right(CartModel.fromJson(data)));
    } catch (e) {
      if (e is DioException) {
        return Future.value(left(Serverfailure.fromDioException(e)));
      }
      return Future.value(left(Serverfailure(e.toString())));
    }
  }
}
