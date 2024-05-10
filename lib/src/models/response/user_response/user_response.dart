import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'jwt')
  String jwt;
  @JsonKey(name: 'user')
  UserEntity userEntity;

  UserResponse({
    required this.userEntity,
    required this.jwt,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
