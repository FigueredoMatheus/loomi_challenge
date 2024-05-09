// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosterAttributesResponse _$PosterAttributesResponseFromJson(
        Map<String, dynamic> json) =>
    PosterAttributesResponse(
      ext: json['ext'] as String,
      size: (json['size'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$PosterAttributesResponseToJson(
        PosterAttributesResponse instance) =>
    <String, dynamic>{
      'ext': instance.ext,
      'size': instance.size,
      'height': instance.height,
      'width': instance.width,
      'url': instance.url,
    };
