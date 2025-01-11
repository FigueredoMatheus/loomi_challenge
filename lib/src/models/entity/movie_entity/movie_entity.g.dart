// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
      title: json['title'] as String,
      endDate: DateTime.parse(json['end_date'] as String),
      genre: json['genre'] as String,
      id: json['id'] as String?,
      synopsis: json['synopsis'] as String,
      posterImage: json['poster_image'] as String,
      streamLink: json['stream_link'] as String,
    )..comments = (json['comments'] as List<dynamic>)
        .map((e) => MovieCommentEntity.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'synopsis': instance.synopsis,
      'genre': instance.genre,
      'end_date': instance.endDate.toIso8601String(),
      'stream_link': instance.streamLink,
      'poster_image': instance.posterImage,
      'comments': instance.comments,
    };
