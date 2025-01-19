import 'package:json_annotation/json_annotation.dart';
import 'subtitle_attributes.dart';

part 'subtitle_data.g.dart';

@JsonSerializable()
class SubtitleData {
  final int id;
  final SubtitleAttributes attributes;

  SubtitleData({required this.id, required this.attributes});

  factory SubtitleData.fromJson(Map<String, dynamic> json) =>
      _$SubtitleDataFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleDataToJson(this);
}
