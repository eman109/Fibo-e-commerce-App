import 'package:json_annotation/json_annotation.dart';

part 'pay_intent_model.g.dart';

@JsonSerializable()
class PayIntentModel {
  String clientSecret;
  PayIntentModel({required this.clientSecret});
  factory PayIntentModel.fromJson(Map<String, dynamic> json) =>
      _$PayIntentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PayIntentModelToJson(this);
}
