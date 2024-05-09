// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosterResponse _$PosterResponseFromJson(Map<String, dynamic> json) =>
    PosterResponse(
      id: (json['id'] as num).toInt(),
      attributes: PosterAttributesResponse.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterResponseToJson(PosterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
