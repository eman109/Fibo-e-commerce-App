import 'package:json_annotation/json_annotation.dart';
part 'usermodel.g.dart';

@JsonSerializable()
class Usermodel {
  int id;
  String email;
  String username;
  Usermodel({required this.email, required this.id, required this.username});
  factory Usermodel.fromJson(Map<String, dynamic> json) =>
      _$UsermodelFromJson(json);
}
