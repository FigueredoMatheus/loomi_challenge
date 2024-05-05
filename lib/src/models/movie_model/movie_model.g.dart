// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String,
      sinopse: json['sinopse'] as String,
      genre: json['genre'] as String,
      expiresDate: DateTime.parse(json['expiresDate'] as String),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => MovieCommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sinopse': instance.sinopse,
      'genre': instance.genre,
      'expiresDate': instance.expiresDate.toIso8601String(),
      'comments': instance.comments,
    };
