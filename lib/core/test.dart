// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies/core/utils/enums.dart';
// import 'package:movies/modules/movies/domain/entities/movie.dart';
// import 'package:movies/modules/movies/domain/use_case/get_now_playing.dart';

// class BlocMovies extends Bloc<MoviesEvent,MoviesStatesMovie>{
//   final GetNowPlayingUesCase getNowPlayingUesCase;
//
//   BlocMovies(this.getNowPlayingUesCase):super(const MoviesStatesMovie()){
//
//     on<GetNowPlayingMovies>((event,emit)async{
//       emit(const MoviesStatesMovie(nowPlayingMoviesState: RequestState.loading));
//      final result= await getNowPlayingUesCase.execute();
//       result.fold((error){
//         emit( const MoviesStatesMovie(
//           nowPlayingMoviesState: RequestState.error,
//
//         ));
//       },(success){
//         emit( MoviesStatesMovie(
//             nowPlayingMovies: success,
//             nowPlayingMoviesState: RequestState.loaded));
//
//       });
//
//
//
//
//
//     });
//   }
// }
//
//
// abstract class MoviesEvent extends Equatable{
//   const MoviesEvent();
//   @override
//   List<Object?> get props =>[];
//
// }
//
// class GetNowPlayingMovies extends MoviesEvent{}
// class GetPopularMovies extends MoviesEvent{}
// class GetTopRatedMovies extends MoviesEvent{}
//
// class MoviesStatesMovie extends Equatable{
//
//   final List<Movie>nowPlayingMovies;
//   final String nowPlayingMoviesMessage;
//   final RequestState nowPlayingMoviesState;
//
//   const MoviesStatesMovie({
//     this.nowPlayingMovies = const [],
//     this.nowPlayingMoviesMessage = '',
//     this.nowPlayingMoviesState = RequestState.loading
//
//   });
//
//   @override
//   List<Object?> get props => [nowPlayingMovies,nowPlayingMoviesMessage,nowPlayingMoviesState];
//
// }