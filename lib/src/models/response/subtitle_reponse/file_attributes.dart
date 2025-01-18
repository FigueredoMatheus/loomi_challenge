import 'package:json_annotation/json_annotation.dart';

part 'file_attributes.g.dart';

@JsonSerializable()
class FileAttributes {
  final String name;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final String? formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final String? previewUrl;
  final String provider;
  @JsonKey(name: 'provider_metadata')
  final String? providerMetadata;
  final String createdAt;
  final String updatedAt;

  FileAttributes({
    required this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FileAttributes.fromJson(Map<String, dynamic> json) =>
      _$FileAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$FileAttributesToJson(this);
}
