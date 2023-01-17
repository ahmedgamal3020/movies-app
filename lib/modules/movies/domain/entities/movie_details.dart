import 'package:equatable/equatable.dart';
import 'package:movies/modules/movies/domain/entities/genre.dart';

class MovieDetails extends Equatable{
  final String backdropPath;
  final String title;
  final double voteAverage;
  final int runTime;
  final String releaseDate;
  final String overView;
  final int id;
  final List<Genres> genre;

 const MovieDetails({
   required this.genre,
   required this.backdropPath,
   required this.title,
   required this.voteAverage,
   required this.runTime,
   required this.releaseDate,
   required this.overView,
   required this.id,
 });

  @override
  List<Object?> get props =>[
    genre,
    backdropPath,
    title,
    voteAverage,
    runTime,
    releaseDate,
    overView,
    id,

  ];


}