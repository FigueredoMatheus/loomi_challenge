import 'package:json_annotation/json_annotation.dart';
import 'file_data_wrapper.dart';

part 'subtitle_attributes.g.dart';

@JsonSerializable()
class SubtitleAttributes {
  final String language;
  @JsonKey(name: 'default')
  final bool isDefault;
  @JsonKey(name: 'url_link')
  final String? urlLink;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final FileDataWrapper file;

  SubtitleAttributes({
    required this.language,
    required this.isDefault,
    this.urlLink,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.file,
  });

  factory SubtitleAttributes.fromJson(Map<String, dynamic> json) =>
      _$SubtitleAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleAttributesToJson(this);
}
