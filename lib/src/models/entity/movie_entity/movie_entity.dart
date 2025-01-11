import 'package:loomi_challenge/src/models/movie_comment_model/movie_comment_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loomi_challenge/src/models/response/movie/movie_response.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {
  String? id;
  final String title;
  final String synopsis;
  final String genre;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @JsonKey(name: 'stream_link')
  final String streamLink;
  @JsonKey(name: 'poster_image')
  final String posterImage;
  final List<MovieCommentModel> comments;

  int get numberOfComments => comments.length;

  bool get hasComment => comments.isNotEmpty;

  MovieCommentModel get mostRecenteComment =>
      comments.reduce((value, element) =>
          value.createAt.isAfter(element.createAt) ? value : element);

  MovieEntity({
    required this.title,
    required this.endDate,
    required this.genre,
    required this.id,
    required this.synopsis,
    required this.posterImage,
    required this.streamLink,
    required this.comments,
  });

  factory MovieEntity.fromResponse(MovieResponse response) {
    return MovieEntity(
      id: response.movieDataResponse.id.toString(),
      title: response.movieDataResponse.attributes.name,
      endDate: response.movieDataResponse.attributes.endDate,
      genre: response.movieDataResponse.attributes.genre,
      synopsis: response.movieDataResponse.attributes.synopsis,
      posterImage: response.movieDataResponse.attributes.poster
          .posterDataResponse.attributes.posterImage,
      streamLink: response.movieDataResponse.attributes.streamLink,
      comments: [],
    );
  }

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
