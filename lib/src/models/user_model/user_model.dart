import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'user_id')
  final String? id;
  final String email;
  String name;
  String? image;

  bool get hasImage => image != null;

  UserModel({
    required this.name,
    required this.email,
    this.id,
    this.image,
  });

  setName(String name) {
    this.name = name;
  }

  setImage(String? image) {
    this.image = image;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
