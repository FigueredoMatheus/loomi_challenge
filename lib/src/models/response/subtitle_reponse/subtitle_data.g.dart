// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubtitleData _$SubtitleDataFromJson(Map<String, dynamic> json) => SubtitleData(
      id: (json['id'] as num).toInt(),
      attributes: SubtitleAttributes.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleDataToJson(SubtitleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
