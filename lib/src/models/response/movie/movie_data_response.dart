import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/response/movie/movie_attributes.dart';

part 'movie_data_response.g.dart';

@JsonSerializable()
class MovieDataResponse {
  final int id;
  final MovieAttributesResponse attributes;

  MovieDataResponse({
    required this.id,
    required this.attributes,
  });

  factory MovieDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataResponseToJson(this);
}
