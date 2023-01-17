import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/base_use_case/base_use_case.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/use_case/get_now_playing.dart';
import 'package:movies/modules/movies/domain/use_case/get_popular.dart';
import 'package:movies/modules/movies/domain/use_case/get_top_rated.dart';
import 'package:movies/modules/movies/presentation/screens/movie_screen/cubit/states.dart';

class MoviesCubit extends Cubit<MoviesStates>{
  final GetNowPlayingUesCase getNowPlayingUesCase;
  final GetPopularUesCase getPopularUesCase;
  final GetTopRatedUesCase getTopRatedUesCase;

  MoviesCubit(
      this.getNowPlayingUesCase,
      this.getPopularUesCase,
      this.getTopRatedUesCase)
      :super(MoviesInitialState());

  static MoviesCubit get(context)=>BlocProvider.of(context);

  List<Movie> nowPlayingModel=[];
  Future<void> getNowPlayingMovies()async {
    emit(MoviesNowPlayingLoadingState());
    final result=await getNowPlayingUesCase(const NoParameters());
    result.fold((error){
      emit(MoviesNowPlayingErrorState(error.message));

    },(success){
      nowPlayingModel=success;
      emit(MoviesNowPlayingSuccessState(success));

    });


  }

  List<Movie>popularModel=[];
  Future<void> getPopularMovies()async {
    emit(MoviesPopularLoadingState());

    final result=await getPopularUesCase(const NoParameters());
    result.fold((error){
      emit(MoviesPopularErrorState(error.message));

    },(success){
      popularModel=success;
      emit(MoviesPopularSuccessState(success));

    });


  }

  List<Movie>topRatedModel=[];
  Future<void> getTopRatedMovies()async{
    emit(MoviesTopRatedLoadingState());

    final result=await getTopRatedUesCase(const NoParameters());
    result.fold((error){
      emit(MoviesTopRatedErrorState(error.message));

    },(success){
      topRatedModel=success;
      print(topRatedModel[0].id);
      print(topRatedModel[0].title);
      emit(MoviesTopRatedSuccessState(success));

    });


  }


}

