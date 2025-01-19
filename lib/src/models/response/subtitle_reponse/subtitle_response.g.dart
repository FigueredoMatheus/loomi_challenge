// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubtitleResponse _$SubtitleResponseFromJson(Map<String, dynamic> json) =>
    SubtitleResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => SubtitleData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubtitleResponseToJson(SubtitleResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
