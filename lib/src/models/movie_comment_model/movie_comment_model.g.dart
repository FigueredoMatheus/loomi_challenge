// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCommentModel _$MovieCommentModelFromJson(Map<String, dynamic> json) =>
    MovieCommentModel(
      comment: json['comment'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['create_at'] as String),
      replies: (json['replies'] as num).toInt(),
    )..commentId = json['comment_id'] as String?;

Map<String, dynamic> _$MovieCommentModelToJson(MovieCommentModel instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'comment': instance.comment,
      'user': instance.user,
      'create_at': instance.createAt.toIso8601String(),
      'replies': instance.replies,
    };
