class ApiConstants{

  static const String  baseUrl ='https://api.themoviedb.org/3';
  static const String  appKey ='1a753a892c02f4dc13a98232f4ea5bfe';
  static const String  nowPlayingPath ='$baseUrl/movie/now_playing?api_key=$appKey';
  static const String  popularPath ='$baseUrl/movie/popular?api_key=$appKey';
  static const String  topRatedPath ='$baseUrl/movie/top_rated?api_key=$appKey';
  static const String  baseImageUrl ='https://image.tmdb.org/t/p/w500/';

  static String imageUrl(String path)=> '$baseImageUrl$path';

}


class EndPoint{

  static const String nowPlaying= "/movie/now_playing";
  static const String popular= "/movie/popular";
  static const String topRated= "/movie/top_rated";

}