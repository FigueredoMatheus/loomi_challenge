// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosterDataResponse _$PosterDataResponseFromJson(Map<String, dynamic> json) =>
    PosterDataResponse(
      posterDataResponse:
          PosterResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterDataResponseToJson(PosterDataResponse instance) =>
    <String, dynamic>{
      'data': instance.posterDataResponse,
    };
