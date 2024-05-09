// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieAttributesResponse _$MovieAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    MovieAttributesResponse(
      name: json['name'] as String,
      synopsis: json['synopsis'] as String,
      streamLink: json['stream_link'] as String,
      genre: json['genre'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      poster:
          PosterDataResponse.fromJson(json['poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieAttributesResponseToJson(
        MovieAttributesResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'synopsis': instance.synopsis,
      'genre': instance.genre,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'stream_link': instance.streamLink,
      'end_date': instance.endDate.toIso8601String(),
      'poster': instance.poster,
    };
