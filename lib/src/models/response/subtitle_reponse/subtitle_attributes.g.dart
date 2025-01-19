// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubtitleAttributes _$SubtitleAttributesFromJson(Map<String, dynamic> json) =>
    SubtitleAttributes(
      language: json['language'] as String,
      isDefault: json['default'] as bool,
      urlLink: json['url_link'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      publishedAt: json['publishedAt'] as String,
      file: FileDataWrapper.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleAttributesToJson(SubtitleAttributes instance) =>
    <String, dynamic>{
      'language': instance.language,
      'default': instance.isDefault,
      'url_link': instance.urlLink,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'publishedAt': instance.publishedAt,
      'file': instance.file,
    };
