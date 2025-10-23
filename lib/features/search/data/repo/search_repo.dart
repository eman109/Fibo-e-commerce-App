import 'package:dartz/dartz.dart';
import 'package:shamel_fibo/core/network/apiConsumer.dart';
import 'package:shamel_fibo/core/network/failures.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';
import 'package:shamel_fibo/features/Home/data/models/response_products_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, ResponseProductsModel>> searchproduct(String query);
}

class SearchrepoImp implements SearchRepo {
  Apiconsumer apiconsumer;
  SearchrepoImp(this.apiconsumer);
  @override
  Future<Either<Failures, ResponseProductsModel>> searchproduct(
    String query,
  ) async {
    try {
      final data = await apiconsumer.get(
        "https://dummyjson.com/products/search",
        queryParameter: {"q": query},
      );
      return Future.value(right(ResponseProductsModel.fromJson(data)));
    } catch (e) {
      return Future.value(left(Serverfailure(e.toString())));
    }
  }
}
