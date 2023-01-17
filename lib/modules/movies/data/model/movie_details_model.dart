import 'package:movies/modules/movies/data/model/genres_model.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel(
      {
        required super.genre,
        required super.backdropPath,
        required super.title,
        required super.voteAverage,
        required super.runTime,
        required super.releaseDate,
        required super.overView,
        required super.id
      });

  factory MovieDetailsModel.fromJson(Map<String,dynamic>json){

    return MovieDetailsModel(
        genre: List<GenresModel>.from(json['genres'].map((e)=>GenresModel.fromJson(e))),
        backdropPath: json['backdrop_path'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        runTime: json['runtime'],
        releaseDate: json['release_date'],
        overView: json['overview'],
        id: json['id']
    );
  }


}