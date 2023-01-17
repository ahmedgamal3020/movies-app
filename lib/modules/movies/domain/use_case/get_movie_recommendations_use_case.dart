import 'package:dartz/dartz.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/domain/entities/movie_recommendations.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationsUseCase extends BaseUseCase<List<MovieRecommendations>,int>{
  BaseMoviesRepository baseMoviesRepository;
  GetMovieRecommendationsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MovieRecommendations>>> call(int parameters)async {

    return await baseMoviesRepository.getMovieRecommendation(parameters);
  }


}