import 'package:json_annotation/json_annotation.dart';

part 'cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel {
  int? id;
  String? title;
  double? price;
  int? quantity;
  String? tumbnail;

  CartProductModel({
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.tumbnail,
  });
  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      _$CartProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
}
