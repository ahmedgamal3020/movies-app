import 'package:movies/modules/movies/domain/entities/movie.dart';

abstract class MoviesStates{}


class MoviesInitialState extends MoviesStates{}

class MoviesNowPlayingLoadingState extends MoviesStates{}

class MoviesNowPlayingSuccessState extends MoviesStates{
  List<Movie> model;
  MoviesNowPlayingSuccessState(this.model);

}

class MoviesNowPlayingErrorState extends MoviesStates{

  final String error;

  MoviesNowPlayingErrorState(this.error);
}

class MoviesPopularLoadingState extends MoviesStates{}

class MoviesPopularSuccessState extends MoviesStates{
  List<Movie> model;
  MoviesPopularSuccessState(this.model);
}

class MoviesPopularErrorState extends MoviesStates{

  final String error;

  MoviesPopularErrorState(this.error);
}

class MoviesTopRatedLoadingState extends MoviesStates{}

class MoviesTopRatedSuccessState extends MoviesStates{
  List<Movie> model;
  MoviesTopRatedSuccessState(this.model);
}

class MoviesTopRatedErrorState extends MoviesStates{

  final String error;

  MoviesTopRatedErrorState(this.error);
}


