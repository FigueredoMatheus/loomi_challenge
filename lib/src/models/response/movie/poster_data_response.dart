import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/response/movie/poster_response.dart';

part 'poster_data_response.g.dart';

@JsonSerializable()
class PosterDataResponse {
  @JsonKey(name: 'data')
  final PosterResponse posterDataResponse;

  PosterDataResponse({required this.posterDataResponse});

  factory PosterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PosterDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosterDataResponseToJson(this);
}
