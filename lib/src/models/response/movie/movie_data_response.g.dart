// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDataResponse _$MovieDataResponseFromJson(Map<String, dynamic> json) =>
    MovieDataResponse(
      id: (json['id'] as num).toInt(),
      attributes: MovieAttributesResponse.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDataResponseToJson(MovieDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
