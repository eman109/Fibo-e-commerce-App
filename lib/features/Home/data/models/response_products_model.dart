import 'package:json_annotation/json_annotation.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';

part 'response_products_model.g.dart';

@JsonSerializable()
class ResponseProductsModel {
  List<ProductModel> products;
  int total;
  int skip;
  int limit;
  ResponseProductsModel(this.limit, this.products, this.skip, this.total);
  factory ResponseProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseProductsModelToJson(this);
}
