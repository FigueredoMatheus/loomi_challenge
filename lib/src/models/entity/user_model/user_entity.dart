import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  String? jwt;
  int? id;
  String? image;
  String email;
  String username;
  bool confirmed;

  bool get hasImage => image != null && image!.isNotEmpty;

  UserEntity({
    required this.username,
    required this.email,
    required this.confirmed,
    this.id,
    this.image,
    this.jwt,
  });

  setName(String name) {
    this.username = name;
  }

  setImage(String? image) {
    this.image = image;
  }

  onLogout() {
    jwt = null;
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
