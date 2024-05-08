// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentModel _$MovieCommentModelFromJson(Map<String, dynamic> json) =>
    MovieCommentModel(
      comment: json['comment'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['create_at'] as String),
      replies: (json['replies'] as num).toInt(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$MovieCommentModelToJson(MovieCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'user': instance.user,
      'create_at': instance.createAt.toIso8601String(),
      'replies': instance.replies,
    };
