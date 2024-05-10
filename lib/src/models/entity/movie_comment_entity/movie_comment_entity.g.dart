// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentEntity _$MovieCommentEntityFromJson(Map<String, dynamic> json) =>
    MovieCommentEntity(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      userImage: json['image'] as String,
      comment: json['comment'] as String,
      createAt: DateTime.parse(json['create_at'] as String),
      replies: (json['replies'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$MovieCommentEntityToJson(MovieCommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'username': instance.username,
      'image': instance.userImage,
      'replies': instance.replies,
      'user_id': instance.userId,
      'create_at': instance.createAt.toIso8601String(),
    };
