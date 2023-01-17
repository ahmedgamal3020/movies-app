import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/data/data_source/base_movie_remote_data_source.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';
import 'package:movies/modules/movies/domain/entities/movie_recommendations.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/modules/movies/domain/use_case/get_movie_details_use_case.dart';

class MovieRepository extends BaseMoviesRepository{

  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);
  @override
  Future< Either<Failure, List<Movie>>> getNowPlaying() async{
    final result =await baseMovieRemoteDataSource.getNowPlayingMovie();
  try {
    return Right(result);
  }on ServerExceptions catch(e){
    return Left(ServerFailure(e.errorMessageModel.statusMessage));
  }
  }

  @override
  Future< Either<Failure, List<Movie>>> getPopular() async{
    final result =await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    }on ServerExceptions catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future< Either<Failure, List<Movie>>> getTopRated() async{
    final result =await baseMovieRemoteDataSource.getTopRatedMovie();
    try {
      return Right(result);
    }on ServerExceptions catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future< Either<Failure, MovieDetails>> getMovieDetails(BaseMovieParameters parameters) async{
    final result =await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    }on ServerExceptions catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendations>>> getMovieRecommendation(int parameters)async {
    final result = await baseMovieRemoteDataSource.getMovieRecommendations(parameters);

    try{

      return Right(result);
    }on ServerExceptions catch(e){

      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

}