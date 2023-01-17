class ApiConstants{

  static const String  baseUrl ='https://api.themoviedb.org/3';
  static const String  appKey ='fdaf2ff1b787d9dcbf42bb15fbafc5a7';
  static const String  nowPlayingPath ='$baseUrl/movie/now_playing?api_key=$appKey';
  static const String  popularPath ='$baseUrl/movie/popular?api_key=$appKey';
  static const String  topRatedPath ='$baseUrl/movie/top_rated?api_key=$appKey';
  static const String  baseImageUrl ='https://image.tmdb.org/t/p/w500/';


  static String imageUrl(String path)=> '$baseImageUrl$path';
  static String idMovie(int id)=> '$baseUrl/movie/$id?api_key=$appKey';
  static String idMovieRecommendations(int id)=> '$baseUrl/movie/$id/recommendations?api_key=$appKey';

}


class EndPoint{

  static const String nowPlaying= "/movie/now_playing";
  static const String popular= "/movie/popular";
  static const String topRated= "/movie/top_rated";

}