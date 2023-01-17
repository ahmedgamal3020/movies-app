import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';
import 'package:movies/modules/movies/domain/entities/movie_recommendations.dart';
import 'package:movies/modules/movies/domain/use_case/get_movie_details_use_case.dart';

abstract class BaseMoviesRepository{

  Future< Either<Failure, List<Movie>>> getNowPlaying();

  Future< Either<Failure, List<Movie>>> getPopular();

  Future< Either<Failure, List<Movie>>> getTopRated();

  Future< Either<Failure, MovieDetails>> getMovieDetails(BaseMovieParameters parameters);

  Future< Either<Failure, List<MovieRecommendations>>> getMovieRecommendation(int parameters);

}