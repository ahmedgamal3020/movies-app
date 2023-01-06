
import 'package:dartz/dartz.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';

class GetPopularUesCase extends BaseUseCase<List<Movie>>{
  BaseMoviesRepository baseMoviesRepository;

  GetPopularUesCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{

    return await baseMoviesRepository.getPopular();
  }

}