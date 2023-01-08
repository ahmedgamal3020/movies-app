import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';

abstract class BaseMoviesRepository{

  Future< Either<Failure, List<Movie>>> getNowPlaying();

  Future< Either<Failure, List<Movie>>> getPopular();

  Future< Either<Failure, List<Movie>>> getTopRated();

  Future< Either<Failure, MovieDetails>> getMovieDetails();
}