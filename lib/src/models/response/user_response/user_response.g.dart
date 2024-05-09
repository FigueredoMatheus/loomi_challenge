// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      userEntity: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      jwt: json['jwt'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'user': instance.userEntity,
    };
