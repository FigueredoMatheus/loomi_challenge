import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';
import 'package:loomi_challenge/src/models/response/subtitle_reponse/subtitle_data.dart';

part 'subtitle_response.g.dart';

@JsonSerializable()
class SubtitleResponse {
  final List<SubtitleData> data;

  ExceptionModel? exception;

  bool get success => exception == null;

  SubtitleResponse({required this.data});

  setException(ExceptionModel exception) {
    this.exception = exception;
  }

  factory SubtitleResponse.fromJson(Map<String, dynamic> json) =>
      _$SubtitleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleResponseToJson(this);
}
