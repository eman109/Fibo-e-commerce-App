import 'package:json_annotation/json_annotation.dart';
import 'package:shamel_fibo/features/cart/data/model/cart_product_model.dart';
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  int? id;
  List<CartProductModel> products;
  double total;
  double? discountTotal;
  int? totalProduct;

  CartModel({
    this.discountTotal,
    this.id,
    required this.products,
    required this.total,
    this.totalProduct,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
