part of 'cubit_movie_details.dart';

abstract class MovieDetailsStates {}

class MovieDetailsInitial extends MovieDetailsStates {}

class MoviesDetailsLoadingState extends MovieDetailsStates{}

class MoviesDetailsSuccessState extends MovieDetailsStates{
  MovieDetails model;
  MoviesDetailsSuccessState(this.model);
}

class MoviesDetailsErrorState extends MovieDetailsStates{

   final dynamic error;

  MoviesDetailsErrorState(this.error);
}


class MoviesRecommendationsLoadingState extends MovieDetailsStates{}

class MoviesRecommendationsSuccessState extends MovieDetailsStates{
  List<MovieRecommendations> model;
  MoviesRecommendationsSuccessState(this.model);
}

class MoviesRecommendationsErrorState extends MovieDetailsStates{

  final dynamic error;

  MoviesRecommendationsErrorState(this.error);
}
