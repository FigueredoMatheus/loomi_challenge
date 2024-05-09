import 'package:json_annotation/json_annotation.dart';

part 'poster_attributes.g.dart';

@JsonSerializable()
class PosterAttributesResponse {
  final String ext;
  final double size;
  final double height;
  final double width;
  final String url;

  PosterAttributesResponse(
      {required this.ext,
      required this.size,
      required this.height,
      required this.width,
      required this.url});

  factory PosterAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$PosterAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosterAttributesResponseToJson(this);
}
