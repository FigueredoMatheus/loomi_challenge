import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final String provider;

  String? jwt;

  int? id;

  String? image;

  String email;

  String username;

  bool confirmed;

  bool blocked;

  bool get hasImage => image != null && image!.isNotEmpty;

  UserEntity({
    required this.provider,
    required this.username,
    required this.email,
    required this.confirmed,
    required this.blocked,
    this.id,
    this.image,
    this.jwt,
  });

  setJwt(String? value) {
    this.jwt = value;
  }

  setName(String name) {
    this.username = name;
  }

  setImage(String? image) {
    this.image = image;
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
