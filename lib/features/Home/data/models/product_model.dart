import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? title;
  String? description;
  String? thumbnail;
  double? price;
  // String? category;
  // double? price;
  // double? discountPercentage;
  // double? rating;
  // int? stock;
  // List<String>? tags;
  // String? brand;
  // String? sku;
  // double? weight;

  ProductModel(
    this.description,
    this.id,
    this.title,
    this.price,
    this.thumbnail,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
