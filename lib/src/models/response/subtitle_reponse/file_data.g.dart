// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileData _$FileDataFromJson(Map<String, dynamic> json) => FileData(
      id: (json['id'] as num).toInt(),
      attributes:
          FileAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileDataToJson(FileData instance) => <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
