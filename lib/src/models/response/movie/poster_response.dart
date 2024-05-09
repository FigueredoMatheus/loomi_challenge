import 'package:loomi_challenge/src/models/response/movie/poster_attributes.dart';

import 'package:json_annotation/json_annotation.dart';

part 'poster_response.g.dart';

@JsonSerializable()
class PosterResponse {
  final int id;
  final PosterAttributesResponse attributes;

  PosterResponse({
    required this.id,
    required this.attributes,
  });

  factory PosterResponse.fromJson(Map<String, dynamic> json) =>
      _$PosterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosterResponseToJson(this);
}
