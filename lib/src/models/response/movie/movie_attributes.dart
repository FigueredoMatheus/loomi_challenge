import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/response/movie/poster_data_response.dart';

part 'movie_attributes.g.dart';

@JsonSerializable()
class MovieAttributesResponse {
  final String name;
  final String synopsis;
  final String genre;
  final DateTime publishedAt;
  @JsonKey(name: 'stream_link')
  final String streamLink;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @JsonKey(name: 'poster')
  final PosterDataResponse poster;

  MovieAttributesResponse({
    required this.name,
    required this.synopsis,
    required this.streamLink,
    required this.genre,
    required this.publishedAt,
    required this.endDate,
    required this.poster,
  });

  factory MovieAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieAttributesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieAttributesResponseToJson(this);
}
