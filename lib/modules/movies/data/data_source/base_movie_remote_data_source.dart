import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/utils/constants/api_constants.dart';
import 'package:movies/modules/movies/data/model/movie_model.dart';


abstract class BaseMovieRemoteDataSource{

  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();
}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async{
    final response = await Dio().get(ApiConstants.nowPlayingPath);
    if(response.statusCode==200)
      {
        return List<MovieModel>.
        from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
      }
    else
    {
     throw Exception(ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async{
    final response = await Dio().get(ApiConstants.popularPath);

    if(response.statusCode==200)
    {
      return List<MovieModel>.
      from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
    }
    else
    {
      throw Exception(ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async{
    final response = await Dio().get(ApiConstants.topRatedPath);

    if(response.statusCode==200)
    {
      return List<MovieModel>.
      from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
    }
    else
    {
      throw Exception(ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

}