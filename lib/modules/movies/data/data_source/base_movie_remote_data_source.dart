import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/core/utils/constants/api_constants.dart';
import 'package:movies/modules/movies/data/model/movie_details_model.dart';
import 'package:movies/modules/movies/data/model/movie_model.dart';
import 'package:movies/modules/movies/data/model/movie_recommendations_model.dart';
import 'package:movies/modules/movies/domain/use_case/get_movie_details_use_case.dart';


abstract class BaseMovieRemoteDataSource{

  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<MovieDetailsModel> getMovieDetails(BaseMovieParameters parameters);
  
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(int parameters);
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

  @override
  Future<MovieDetailsModel> getMovieDetails(parameters) async{

    final response = await Dio().get(ApiConstants.idMovie(parameters.movieId));

    if(response.statusCode==200)
    {
      return MovieDetailsModel.fromJson(response.data);
    }
    else
    {
      throw Exception(ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(parameters)async {
    
    
    final response =await Dio().get(ApiConstants.idMovieRecommendations(parameters));

    if(response.statusCode==200){

      return List<MovieRecommendationsModel>
          .from((response.data['results']as List).map((e) => MovieRecommendationsModel.fromJson(e)));
    }
    else{

      throw Exception(ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
    
  }


}