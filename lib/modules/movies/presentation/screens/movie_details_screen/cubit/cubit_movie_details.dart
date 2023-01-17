import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/modules/movies/domain/entities/movie_details.dart';
import 'package:movies/modules/movies/domain/entities/movie_recommendations.dart';
import 'package:movies/modules/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movies/modules/movies/domain/use_case/get_movie_recommendations_use_case.dart';

part 'states_movie_details.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  MovieDetailsCubit(this.getMovieDetailsUseCase,
      this.getMovieRecommendationsUseCase,
     ) : super(MovieDetailsInitial());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);


    MovieDetails? movieDetailsModel;

    Future<void> getMovieDetails({required int id})async{
    emit(MoviesDetailsLoadingState());
    final result= await getMovieDetailsUseCase(BaseMovieParameters(id));
      result.fold(
      (l) {
      print("Error= ${l.message}");
      emit(MoviesDetailsErrorState(l.message));
      },(r) {
      movieDetailsModel = r;
      print("Error= ${movieDetailsModel}");
      emit(MoviesDetailsSuccessState(r));


    });

  }

  List<MovieRecommendations> movieRecommendationsModel = [];

  Future<void> getMovieRecommendations({required int id}) async {
    emit(MoviesRecommendationsLoadingState());
    final result = await getMovieRecommendationsUseCase(id);

    result.fold((l) {
      emit(MoviesRecommendationsErrorState(l.message));
    }, (r) {
      movieRecommendationsModel = r;
      emit(MoviesRecommendationsSuccessState(r));
    });
  }
}