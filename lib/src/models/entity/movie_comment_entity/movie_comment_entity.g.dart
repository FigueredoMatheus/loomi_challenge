// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentEntity _$MovieCommentEntityFromJson(Map<String, dynamic> json) =>
    MovieCommentEntity(
      comment: json['comment'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['create_at'] as String),
      replies: (json['replies'] as num).toInt(),
    )..id = json['id'] as String?;

Map<String, dynamic> _$MovieCommentEntityToJson(MovieCommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'user': instance.user,
      'create_at': instance.createAt.toIso8601String(),
      'replies': instance.replies,
    };
