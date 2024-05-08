import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/entity/user_model/user_entity.dart';

part 'user_register_response.g.dart';

@JsonSerializable()
class UserRegisterResponse {
  String jwt;
  @JsonKey(name: 'user')
  UserEntity userEntity;

  UserRegisterResponse({
    required this.userEntity,
    required this.jwt,
  });

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterResponseToJson(this);
}
