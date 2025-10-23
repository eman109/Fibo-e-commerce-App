// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseProductsModel _$ResponseProductsModelFromJson(
  Map<String, dynamic> json,
) => ResponseProductsModel(
  (json['limit'] as num).toInt(),
  (json['products'] as List<dynamic>)
      .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['skip'] as num).toInt(),
  (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ResponseProductsModelToJson(
  ResponseProductsModel instance,
) => <String, dynamic>{
  'products': instance.products,
  'total': instance.total,
  'skip': instance.skip,
  'limit': instance.limit,
};
