import 'package:json_annotation/json_annotation.dart';

part 'poster_attributes.g.dart';

@JsonSerializable()
class PosterAttributesResponse {
  final String ext;
  final double size;
  final double height;
  final double width;
  @JsonKey(name: 'url')
  final String posterImage;

  PosterAttributesResponse({
    required this.ext,
    required this.size,
    required this.height,
    required this.width,
    required this.posterImage,
  });

  factory PosterAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$PosterAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosterAttributesResponseToJson(this);
}
