import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/response/movie/movie_data_response.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'data')
  final MovieDataResponse movieDataResponse;

  MovieResponse({required this.movieDataResponse});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
