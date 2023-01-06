import 'package:get_it/get_it.dart';
import 'package:movies/modules/movies/data/data_source/base_movie_remote_data_source.dart';
import 'package:movies/modules/movies/data/repository/movie_repository.dart';
import 'package:movies/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/modules/movies/domain/use_case/get_now_playing.dart';
import 'package:movies/modules/movies/domain/use_case/get_popular.dart';
import 'package:movies/modules/movies/domain/use_case/get_top_rated.dart';
import 'package:movies/modules/movies/presentation/cubit/cubit.dart';

final sl= GetIt.instance;
class ServicesLocator{
 void init(){

  // sl.registerFactory(() => BlocMovies(sl()));

  // bloc
  sl.registerFactory(() => MoviesCubit(sl(),sl(),sl()));
  //use case
  sl.registerLazySingleton(() =>GetNowPlayingUesCase(sl()));
  sl.registerLazySingleton(() =>GetPopularUesCase(sl()));
  sl.registerLazySingleton(() =>GetTopRatedUesCase(sl()));
  //repository
  sl.registerLazySingleton<BaseMoviesRepository>(() =>MovieRepository(sl()));
  //data source
  sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
}
}