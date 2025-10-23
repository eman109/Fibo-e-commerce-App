// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usermodel _$UsermodelFromJson(Map<String, dynamic> json) => Usermodel(
  email: json['email'] as String,
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
);

Map<String, dynamic> _$UsermodelToJson(Usermodel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'username': instance.username,
};
