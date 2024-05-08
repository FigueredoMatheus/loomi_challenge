// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      username: json['username'] as String,
      email: json['email'] as String,
      confirmed: json['confirmed'] as bool,
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'id': instance.id,
      'image': instance.image,
      'email': instance.email,
      'username': instance.username,
      'confirmed': instance.confirmed,
    };
