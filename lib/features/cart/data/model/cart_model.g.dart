// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  discountTotal: (json['discountTotal'] as num?)?.toDouble(),
  id: (json['id'] as num?)?.toInt(),
  products:
      (json['products'] as List<dynamic>)
          .map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  total: (json['total'] as num).toDouble(),
  totalProduct: (json['totalProduct'] as num?)?.toInt(),
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  'id': instance.id,
  'products': instance.products,
  'total': instance.total,
  'discountTotal': instance.discountTotal,
  'totalProduct': instance.totalProduct,
};
