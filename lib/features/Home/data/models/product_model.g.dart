// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  json['description'] as String?,
  (json['id'] as num?)?.toInt(),
  json['title'] as String?,
  (json['price'] as num?)?.toDouble(),
  json['thumbnail'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
    };
