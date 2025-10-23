// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
      title: json['title'] as String?,
      tumbnail: json['tumbnail'] as String?,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'quantity': instance.quantity,
      'tumbnail': instance.tumbnail,
    };
