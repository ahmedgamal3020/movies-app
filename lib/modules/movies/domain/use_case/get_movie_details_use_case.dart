import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, BaseMovieParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(BaseMovieParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class BaseMovieParameters extends Equatable {
  final int movieId;

  const BaseMovieParameters(this.movieId);

  @override
  List<Object> get props => [movieId];

}